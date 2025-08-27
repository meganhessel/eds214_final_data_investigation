# The task of the script is to download and clean the raw data. 

# Before performing the tasks, you must downloaded the entire data folder with all 4 csvs: QuebradaCuenca1-Bisley, QuebradaCuenca2-Bisley, QuebradaCuenca3-Bisley, and RioMameyesPuenteRoto. 



#                   Load Data into Script                    ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BQ1_data <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"), na = c("NA"))
BQ2_data <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"), na = c("NA"))
BQ3_data <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"), na = c("NA"))
PRM_data <- read_csv(here("data", "RioMameyesPuenteRoto.csv"), , na = c("NA"))



#    Cleaning and filtering each data set for necessarily columns       ~~~
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


#               merge data into one big frame                       ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
full_data <- rbind(BQ1_data, BQ2_data, BQ3_data, PRM_data)

