#                   Load Data into Script                    ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BQ1_data <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"), na = c("NA"))
BQ2_data <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"), na = c("NA"))
BQ3_data <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"), na = c("NA"))
PRM_data <- read_csv(here("data", "RioMameyesPuenteRoto.csv"), , na = c("NA"))



#     cleaning and filter each data set for necessarily columns       ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BQ1_data <- BQ1_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names()

BQ2_data <- BQ2_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names()

BQ3_data <- BQ3_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names()

PRM_data <- PRM_data %>% 
  select("Sample_ID", "Sample_Date", "NO3-N", "K", "Mg", "Ca", "NH4-N") %>% 
  clean_names()
