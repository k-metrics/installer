# Command line Usage
#   > source('install_packages.R', encoding = 'UTF-8')
#   > install_packages(type = "tidyverse", tools = FALSE)
#
#       type  : "tidyverse"(default), "verse", "mlwr", "tidymodels"
#       tools : FALSE(default) or TRUE
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
  install <- switch(tolower(type)s,
                    "tidyverse" = packages[packages$type %in%  c("tidyverse"), ],
                    "verse" = packages[packages$type %in% c("tidyverse", "verse"), ],
                    "mlwr" = packages[packages$type %in% c("tidyverse", "verse", "mlwr"), ],
                    "tidyomdels" = packages[packages$type %in% c("tidyverse", "verse", "mlwr", "tidymodels"), ],
                    stop('Select type, "tidyverse", "verse", "mlwr" or "tidymodels"')
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
    print(paste0("Install following packages, ", install[!(install %in% installed)]))
    install.packages(install[!(install %in% installed)])
    print("Done.")
  } else {
    print("No packages to install.")
  }
  
} # end of function

