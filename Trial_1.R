library(dplyr)
library(tidyverse)
library(here)
library(ARTofR)
library(skimr)
library(janitor)

basic_data <- read_csv(here::here("data", "BasicFieldData-Streams.csv"))
Q1_data <- read_csv(here::here("data", "QuebradaCuenca1-Bisley.csv"))
Q2_data <- 