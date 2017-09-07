

# R-buildpack for cloudfoundry

This buildpack supports to run R script(shiny framework) on cloudfoundry.
Challenges to run R on cloudfoundry is that, R binary package is built on standard path such as /use/bin, /usr/lib, etc.
It means root proviledge requires to install R binary but root access is not available on CF but 'vcap'. to overcome this, 'chroot','[fakechroot](https://linux.die.net/man/1/fakechroot)' library has been used.

this buildpack inspired from followingbuildpacks.

  https://github.com/cloudfoundry/ruby-buildpack
  
  https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16

  https://github.com/alexkago/cf-buildpack-r/tree/master/test
  

![image](/image1.png "R on shiny sample")

![image](/image2.png "PCF dev apps manager UI")

# Usage
```
cf push your-R-app -b https://github.com/myminseok/R-buildpack
or
cf push your-R-app -b R-buildpack
```

# Installing R Packages into your R runtime
put init.R file in your source code.

refer to: https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16

# Sample app
https://github.com/rstudio/shiny-examples


# Building the Buildpack (simple)

1. setup local development env

  ```bash
  git submodule update --init
  
  BUNDLE_GEMFILE=cf.Gemfile bundle
  ```

1. Build the buildpack

  ``` 
  cd R-buildpack/

  ./build_final.sh

  # login to CF as admin
  cf login

  ./upload_buildpack.sh

  cd test/shiny/001-hello

  cf push

  ```

# Building the Buildpack (advanced)

1. Make sure you have fetched submodules

  ```bash
  git submodule update --init
  ```

1. Get latest buildpack dependencies

  ```shell
  BUNDLE_GEMFILE=cf.Gemfile bundle
  ```

1. Build the buildpack

  a. build base image (R-buildpack/apt-archives/home_vcap_app_fakechroot.tar.gz)
  ``` 
  cd R-buildpack/

  cp manifest_base_image.yml  manifest.yml
  cp ./bin/compile_base_image ./bin/compile

  bundle exec buildpack-packager --cached

  cf delete-buildpack R-buildpack -f
  cf create-buildpack R-buildpack $abs_path/R_buildpack-cached-v0.1.0.zip 13 --enable
  cf update-buildpack R-buildpack -p ./R_buildpack-cached-v0.1.0.zip   

  cd test/build_base_image
  cf push
  cf download-droplet build ./droplet
  tar xf ./droplet
  cp ./app/home_vcap_app_fakechroot.tar.gz [path to R-buildpack/apt-archives]/home_vcap_app_fakechroot.tar.gz

  ```

  b. build final buildpack using the "base image" which has build before.(R-buildpack/R_buildpack-cached-v0.1.0.zip)

  ``` 
  cd R-buildpack/

  cp manifest_final.yml  manifest.yml
  cp ./bin/compile_final ./bin/compile
  
  bundle exec buildpack-packager --cached
  
  cf delete-buildpack R-buildpack -f
  cf create-buildpack R-buildpack $abs_path/R_buildpack-cached-v0.1.0.zip 13 --enable
  cf update-buildpack R-buildpack -p ./R_buildpack-cached-v0.1.0.zip   
 
  cd test/shiny/001-hello
  cf push
  
  ```


1. test buildpack

```
bundle exec buildpack-build
```

1. Use in Cloud Foundry

you may use [pcfdev](https://network.pivotal.io/products/pcfdev) or [Pivotal Cloud Foundry](https://network.pivotal.io/). you need admin priviledge to publish on cloudfoundfy.
```
cf delete-buildpack R-buildpack -f
cf create-buildpack R-buildpack ./R_buildpack-cached-v1.6.47.zip 13 --enable
cf update-buildpack R-buildpack -p ./R_buildpack-cached-v1.6.47.zip   
```

or

edit 'build_buildpack.sh'  and login on cloud foundry as 'admin'
and run the script. it will deploy buildpack to cloud foundry.


# Caching apt, deb, zip file to buildpack.

1. download to './apt-archives' directory
1. put meta info to './mainfest.yml' file. using uri: http, or uri: file:///
for editing manifest.yml, refere to https://docs.cloudfoundry.org/buildpacks/custom.html
you may use script(./bin/R/gen_apt_archives_manifest.sh) to generate meta yml for lots of debs.


# caching shiny binary packages
installing shiny package from sourcecode takes long time for staging 
```
install.packages("shiny", repos='http://cran.us.r-project.org')
```

build binary package in R environment first, 
```
$ wget http://cran.us.r-project.org/src/contrib/shiny_1.0.5.tar.gz
# R installed environment in ubuntu
$ R CMD INSTALL --build ./shiny_1.0.5.tar.gz
```
above command will generate binary package. then cache the binary to buildpack under 'apt-archives' or public uri.
```
$ R CMD INSTALL ./shiny_1.0.5_R_x86_64-pc-linux-gnu.tar.gz
```


# Refer to 
http://engineering.pivotal.io/post/creating-a-custom-buildpack/
https://docs.cloudfoundry.org/buildpacks/custom.html/
https://github.com/cloudfoundry/buildpack-packager/
Official buildpack documentation can be found at [ruby buildpack docs](http://docs.cloudfoundry.org/buildpacks/ruby/index.html).
https://github.com/rstudio/shiny-examples

# TODO

R wrapper
install R studio




