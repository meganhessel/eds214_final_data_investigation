library(dplyr)
library(tidyverse)
library(here)
library(ARTofR)
library(skimr)
library(janitor)

basic_data <- read_csv(here::here("data", "BasicFieldData-Streams.csv"))
CONFLICT_data <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))
