パッケージインストール・スクリプト
================

Japanese Only, in this
repository.

# Introduction

本リポジトリはR/RStudioをインストールした直後、または、メジャーアップデートした直後に普段利用しているパッケージをインストールするためのスクリプトとデータを整理しているリポジトリです。

インストールするパッケージは、 [データ分析勉強会
<i class="fa fa-external-link"></i>](https://sites.google.com/site/kantometrics/home)
で必要になるパッケージが中心です。なお、パッケージに必要なライブラリなど（javaやOSのライブラリなど）のインストールは行いませんので、必要な場合はパッケージインストール前に別途インストールしてください。

## Usage

``` r
source('install_packages.R', encoding = 'UTF-8')
install_packages(type = "tidyverse", tools = FALSE)
```

オプション（引数）の指定値は以下の通りです。また、パッケージを定義しているデータファイル（`packages.csv`）を必ずスクリプトファイルと同じディレクトリに配置してください。
　

### `type`オプション

| `type`     | Description                                                                              |
| ---------- | ---------------------------------------------------------------------------------------- |
| tidyverse  | [rocker/tidyverse](https://hub.docker.com/r/rocker/tidyverse) 相当のパッケージをインストール（省略時のデフォルト） |
| verse      | [rocker/verse](https://hub.docker.com/r/rocker/verse) 相当のパッケージをインストール（除くTinyTeX本体）       |
| mlwr       | [mzdgnk/mlwr](https://hub.docker.com/r/mzdgnk/mlwr) 相当のパッケージをインストール（除くツール類）              |
| tidymodels | [mzdgnk/tidymodels](https://hub.docker.com/r/mzdgnk/tidymodels) 相当のパッケージをインストール（除くツール類）  |

　

### `tools`オプション

| `tools` | Descriotion                  |
| ------- | ---------------------------- |
| FALSE   | ツール類のパッケージをインストールしません（デフォルト） |
| TRUE    | ツール類のパッケージをインストールします         |

　

# Packages

各`type`オプションでインストールされるパッケージは以下の通りになります。

　

## tidyverse

以下のパッケージがインストールされます。

| package     | memo                                                                |
| :---------- | :------------------------------------------------------------------ |
| BiocManager | Access the Bioconductor Project Package Repository                  |
| devtools    | Tools to Make Developing R Packages Easier                          |
| dplyr       | A Grammar of Data Manipulation                                      |
| formatR     | Format R Code Automatically                                         |
| remotes     | R Package Installation from Remote Repositories, Including ‘GitHub’ |
| selectr     | Translate CSS Selectors to XPath Expressions                        |
| tidyverse   | Easily Install and Load the ‘Tidyverse’                             |

　

## verse

`tidyverse`のパッケージに加えて以下のパッケージがインストールされます。なお、TinyTeX本体のインストールは行われませんので、別途インストールしてください。

| package    | memo                                                                               |
| :--------- | :--------------------------------------------------------------------------------- |
| bookdown   | Authoring Books and Technical Documents with R Markdown                            |
| PKI        | Public Key Infrastucture for R Based on the X.509 Standard                         |
| rJava      | Low-Level R to Java Interface                                                      |
| rmdformats | HTML Output Formats and Templates for ‘rmarkdown’ Documents                        |
| rmdshower  | ‘R’ ‘Markdown’ Format for ‘shower’ Presentations                                   |
| tinytex    | Helper Functions to Install and Maintain ‘TeX Live’, and Compile ‘LaTeX’ Documents |

　

## mlwr

`verse`のパッケージに加えて『Rによる機械学習』のサンプルコード実行に必要な以下のパッケージがインストールされます。なお、`RWeka`の実行に必要なJava(JDK)はインストールされませんので、別途インストールし、必要な設定を行ってください。

| package      | memo                                                                                                |
| :----------- | :-------------------------------------------------------------------------------------------------- |
| adabag       | Applies Multiclass AdaBoost.M1, SAMME and Bagging                                                   |
| arules       | Mining Association Rules and Frequent Itemsets                                                      |
| C50          | C5.0 Decision Trees and Rule-Based Models                                                           |
| caret        | Classification and Regression Training                                                              |
| class        | Functions for Classification                                                                        |
| data.table   | Extension of ‘data.frame’                                                                           |
| doParallel   | Foreach Parallel Adaptor for the ‘parallel’ Package                                                 |
| e1071        | Misc Functions of the Department of Statistics, Probability Theory Group (Formerly: E1071), TU Wien |
| ff           | Memory-Efficient Storage of Large Data on Disk and Fast Access Functions                            |
| ffbase       | Basic Statistical Functions for Package ‘ff’                                                        |
| foreach      | Provides Foreach Looping Construct for R                                                            |
| gmodels      | Various R Programming Tools for Model Fitting                                                       |
| httr         | Tools for Working with URLs and HTTP                                                                |
| igraph       | Network Analysis and Visualization                                                                  |
| ipred        | Improved Predictors                                                                                 |
| irr          | Various Coefficients of Interrater Reliability and Agreement                                        |
| kernlab      | Kernel-Based Machine Learning Lab                                                                   |
| kknn         | Weighted k-Nearest Neighbors                                                                        |
| klaR         | Classification and Visualization                                                                    |
| modeest      | Mode Estimation                                                                                     |
| neuralnet    | Training of Neural Networks                                                                         |
| psych        | Procedures for Psychological, Psychometric, and Personality Research                                |
| randomForest | Breiman and Cutler’s Random Forests for Classification and Regression                               |
| ranger       | A Fast Implementation of Random Forests                                                             |
| RCurl        | General Network (HTTP/FTP/…) Client Interface for R                                                 |
| rio          | A Swiss-Army Knife for Data I/O                                                                     |
| rjson        | JSON for R                                                                                          |
| ROCR         | Visualizing the Performance of Scoring Classifiers                                                  |
| RODBC        | ODBC Database Access                                                                                |
| rpart        | Recursive Partitioning and Regression Trees                                                         |
| rpart.plot   | Plot ‘rpart’ Models: An Enhanced Version of ‘plot.rpart’                                            |
| rvest        | Easily Harvest (Scrape) Web Pages                                                                   |
| RWeka        | R/Weka Interface                                                                                    |
| snow         | Simple Network of Workstations                                                                      |
| SnowballC    | Snowball Stemmers Based on the C ‘libstemmer’ UTF-8 Library                                         |
| tm           | Text Mining Package                                                                                 |
| vcd          | Visualizing Categorical Data                                                                        |
| wordcloud    | Word Clouds                                                                                         |
| XML          | Tools for Parsing and Generating XML Within R and S-Plus                                            |
| xml2         | Parse XML                                                                                           |

　

## tidymodels

`mlwr`のパッケージに加えて以下のパッケージがインストールされます。

| package    | memo                                              |
| :--------- | :------------------------------------------------ |
| tidymodels | Easily Install and Load the ‘Tidymodels’ Packages |

　

## tools

`tools = TRUE`オプションを指定した場合は以下のパッケージが追加でインストールされます。

| package       | memo                                             |
| :------------ | :----------------------------------------------- |
| blogdown      | Create Blogs and Websites with R Markdown        |
| DiagrammeR    | Graph/Network Visualization                      |
| DT            | A Wrapper of the JavaScript Library ‘DataTables’ |
| flexdashboard | R Markdown Format for Flexible Dashboards        |
| GGally        | Extension to ‘ggplot2’                           |
| ggrepel       | Repulsive Text and Label Geoms for ‘ggplot2’     |
| gridExtra     | Miscellaneous Functions for “Grid” Graphics      |
| learnr        | Interactive Tutorials for R                      |
| skimr         | Compact and Flexible Summaries of Data           |
| summarytools  | Tools to Quickly and Neatly Summarize Data       |

　

# 備考

パッケージが既にインストールされている場合は依存ファイルを除いてインストールされませんので、必要に応じてパッケージのアップデートを行ってください。また、データファイルの定義を書き換えることでインストールするパッケージを変更することができます。必要に応じて修正してください。ただし、リポジトリはCRAN限定です。  
　  
なお、不明点などは [データ分析勉強
<i class="fa fa-external-link"></i>](https://sites.google.com/site/kantometrics/home)
まで、または、本リポジトリのissues にてお問い合わせください。  
　

-----

[CC
BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.ja)
, Sampo Suzuki
