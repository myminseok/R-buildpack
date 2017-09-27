본 buildpack을 이용하면,  통계분석도구인 [R](http://www.r-project.org/)로 짜여인 R-script를 웹기반 publishing을 자동화 할 수 있습니다.
어플리케이션은 [Pivotal Cloud Foundry](https://pivotal.io/platform)상에 자동으로 배포가 되며, 어플리케이션 구동에 필요한 [Shiny](https://shiny.rstudio.com/) web application framework, R 패키지 [CRAN](http://cran.r-project.org/), OS library가 자동으로 구성됩니다.
이때, 어플리케이션 마다 필요한 실행환경정보는 R-script개발자가 아래의 파일로 제공하게 됩니다.

##  R-script 실행환경 구성을 위한 파일

1. app.R : (필수)  
2. Aptfile :(선택)
3. init.r  : (선택)
4. manifest.yml, run.sh: (필수)

## 작성 예시

### app.R
https://github.com/rstudio/shiny-examples 참조.

### init.R
어플리케이션에서 사용할 R 패키지 목록을 기술합니다.  다운로드 경로는 manifest.yml파일에서 'CRAN_MIRROR' 환경변수에 지정하여 변경할 수 있습니다.

```
# init.R
#
# Example R code to install packages if not already installed
#

my_packages = c("package_name_1", "package_name_2", ...)

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))
```

### run.sh
shiny프레임워크상에서 어플리케이션을 실행하는 스크립트로, 대부부분 변경없이 아래내용 그대로 사용가능합니다.

```
#!/bin/bash
. /.profile.d/r_environment.sh
mkdir -p ./src/contrib/PACKAGES
export FONTCONFIG_PATH=/etc/fonts
R -e "shiny::runApp('/', port=8080, host='0.0.0.0')"
```


### manifest.yml
```
---
applications:
- name: 095-plot
  host: 095-plot
  buildpack: R-buildpack
  command:  source /home/vcap/app/.profile.d/r_environment.sh  ;  fakechroot fakeroot chroot /home/vcap/app sh /run.sh
  memory: 2GB
  disk_quota: 2GB
  health-check-type: process
  env:
    TEST_ENV: testvalue
    PACKAGES: plotly-binary
    #    APT_REPO_UBUNTU: http://kr.archive.ubuntu.com/ubuntu/
    #    APT_REPO_CRAN: http://cloud.r-project.org/bin/linux/ubuntu 
    #    CRAN_MIRROR: http://cloud.r-project.org/
```
- name: (필수) PCF상에서 관리를 위한 어플리케이션 이름
- host: (선택, default는 name항목의 값) apps.pcf.sec.com 도메인의 하위이름으로 사용할 이름 지정.
- APT_REPO_UBUNTU: 필요한 apt library다운로드 경로 default: http://kr.archive.ubuntu.com/ubuntu/
- APT_REPO_CRAN: CRAN에서 참조하는 dependency apt library download경로를 지정합니다. default: http://cloud.r-project.org/bin/linux/ubuntu 
- CRAN MIRROR: init.r파일에 기술된 R package가 다운로드될 경로 default: http://cloud.r-project.org


