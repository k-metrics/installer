# Disclaimer
#   本ファイルは『Rによる機械学習』のサンプルファイルで使用している
#   Rパッケージならびに依存関係のあるパッケージを章単位または一括で
#   インストールするためのスクリプトです。
#   本ファイルを使用することによって生じる、いかなる直接的・間接的損害に
#   ついて著作者ならびに本勉強会運営者はいかなる責任・サポート義務は負い
#   ません。
#
# 前提条件
#   各パッケージが必要とするOS側のライブラリなどはインストールされませんので
#   必要に応じて事前にインストールしてください。
#   RWekaパッケージをインストールする場合にはJava(JDK)がインストール
#   され、パスが通っている必要があります。
# 
#   Linux環境でパッケージをインストールする場合は以下のライブラリを
#   事前にインストールしてください。ファイル名はdebian baseです。
#     liblzma-dev libbz2-dev libjpeg-dev libpng-dev libmagick++-dev
#     imagemagick libpoppler-cpp-dev libpoppler-glib-dev 
#     libfreetype6-dev libglu1-mesa-dev libgl1-mesa-dev zlib1g-dev
#     libopenmpi-dev libopenmpi2
# 
#  # On Ubuntu 16.04 or 18.04, use PPA
#  #   sudo add-apt-repository -y ppa:opencpu/poppler
#  #   sudo apt-get update
#  #   sudo apt-get install -y libpoppler-cpp-dev
# 
# Usage
#   Rで本ファイルをsourceし、`chap`変数に章番号または"all"を指定して
#   実行します。なお、既にインストール済のパッケージはインストール
#   されませんので必要に応じて上書きインストールまたはアップデートして
#   ください。
# 
# Command line Usage
#   > source('install_mlwr_packages.R', encoding = 'UTF-8')
#   > install_mlwr_packages(chap = n)
#
#       n = 1, 2, 3, ..., 12 or "all"
#

require_package <- function(pkg = NULL) {
  if (!require(pkg, character.only = TRUE)) {
    print(paste0("Trying to install ", pkg, "..."))
    install.packages(pkg)
    if (!require(pkg, character.only = TRUE)) {
      stop(paste0("Could NOT install ", pkg, "..."))
    }
  }
} # end of function


install_packages <- function(type = "tidyverse", tools = FALSE) {

  # Require packages
  require_package("devtools")
  require_package("BiocManager")
  require_package("tidyverse")

  # Installed packages
  installed <- installed.packages() %>% 
    as.data.frame(stringsAsFactors = FALSE) %>% 
    .$Package %>% 
    unique()
  
  # Install packages
  packages <- "./packages.csv" %>% 
    read.csv(encoding = "UTF-8", stringsAsFactors = FALSE) %>% 
    dplyr::select(package, type, rep) %>% 
    dplyr::filter(rep == "CRAN")

  # Select package to install
  install <- switch(type,
         "tidyverse" = packages[packages$type %in%  c("tidyverse"), ],
         "verse" = packages[packages$type %in% c("tidyverse", "verse"), ],
         "mlwr" = packages[packages$type %in% c("tidyverse", "verse", "mlwr"), ],
         "tidyomdels" = packages[packages$type %in% c("tidyverse", "verse", "mlwr", "tidymodels"), ]
  )

  # Add tools package, if required
  if (tools == TRUE) {
    install <- install %>% 
      dplyr::bind_rows(packages[packages$type %in% c("tools"), ]) %>% 
      .$package
  } else {
    install <- install$package
  }
  
  # if (!is.null(install)) {
  if (length(install)) {
    install.packages(install[!(install %in% installed)])
  }
  
} # end of function

