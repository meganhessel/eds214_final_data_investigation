## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
## ------------------------ ENVIRONMENT INITIALIZATION---------------------------
##                                                                            --
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Vector of required packages
package_list <- c("tidyverse", "here", "lubridate")

# Check if package is installed and load
for (package in package_list) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package)
  }
}


#                     Load libraries                         ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(here)
library(janitor)
library(tidyverse)
library(tidyr)
library(skimr)
library(dplyr)
