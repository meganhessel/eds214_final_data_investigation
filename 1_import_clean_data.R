##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##----------- DATA MANAGMENT - DOWNLOAD, CLEAN, AND FILTER DATA ----------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Loading data into the script 
BQ1_data <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"), na = c("NA"))
BQ2_data <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"), na = c("NA"))
BQ3_data <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"), na = c("NA"))
PRM_data <- read_csv(here("data", "RioMameyesPuenteRoto.csv"), , na = c("NA"))



# Cleaning and filtering each data set for necessarily columns (Sample_ID, Sample_Date, concentrations of NO3-N, K, Mg, Ca, NH4-N) and for samples between 1988 to 1996 

BQ1_data <- BQ1_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  mutate(year = year(Sample_Date)) %>% 
  filter(year >= "1988" & year <= "1996") %>% 
  clean_names()
 

BQ2_data <- BQ2_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  mutate(year = year(Sample_Date)) %>% 
  filter(year >= "1988" & year <= "1996") %>% 
  clean_names()


BQ3_data <- BQ3_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  mutate(year = year(Sample_Date)) %>% 
  filter(year >= "1988" & year <= "1996") %>% 
  clean_names()

PRM_data <- PRM_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  mutate(year = year(Sample_Date)) %>% 
  filter(year >= "1988" & year <= "1996") %>% 
  clean_names()

