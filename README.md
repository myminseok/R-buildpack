

# R-buildpack for cloudfoundry

This buildpack supports to run R script(shiny framework) on cloudfoundry.
Challenges to run R on cloudfoundry is that, R binary package is built on standard path such as /use/bin, /usr/lib, etc.
It means root proviledge requires to install R binary but root access is not available on CF but 'vcap'. to overcome this, 'chroot','[fakechroot](https://linux.die.net/man/1/fakechroot)' library has been used.

this buildpack inspired from followingbuildpacks.

  https://github.com/cloudfoundry/ruby-buildpack
  
  https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16

  https://github.com/alexkago/cf-buildpack-r/tree/master/test
  
  
# Usage
```
cf push your-R-app -b https://github.com/myminseok/R-buildpack
or
cf push your-R-app -b R-buildpack

```

# Installing R Packages
put init.R file in your source code.

refer to: https://github.com/virtualstaticvoid/heroku-buildpack-r/tree/heroku-16

# Sample app

https://github.com/rstudio/shiny-examples


# Building the Buildpack



1. Make sure you have fetched submodules

  ```bash
  git submodule update --init
  ```

1. Get latest buildpack dependencies

  ```shell
  BUNDLE_GEMFILE=cf.Gemfile bundle
  ```

1. Build the buildpack

  ```shell
  bundle exec buildpack-packager --cached
  BUNDLE_GEMFILE=cf.Gemfile bundle exec buildpack-packager [ --uncached | --cached ]
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
1. put metainfo to './mainfest.yml' file.
for editing manifest.yml, refere to https://docs.cloudfoundry.org/buildpacks/custom.html
you may use script(./bin/R/gen_apt_archives_manifest.sh) to generate meta yml for lots of debs.


# Refer to 
http://engineering.pivotal.io/post/creating-a-custom-buildpack/
https://docs.cloudfoundry.org/buildpacks/custom.html/
https://github.com/cloudfoundry/buildpack-packager/
Official buildpack documentation can be found at [ruby buildpack docs](http://docs.cloudfoundry.org/buildpacks/ruby/index.html).

# TODO
install R studio

minimize buildpack size.

