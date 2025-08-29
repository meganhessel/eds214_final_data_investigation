# load libraries 
library(dplyr)
library(tidyverse)
library(here)
library(ARTofR)
library(skimr)
library(janitor)
library(ggplot2)
library(zoo)
library(tidyr)
library(tidyquant)


#                   Load Data into Script                    ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BQ1_data <- read_csv(here("data", "QuebradaCuenca1-Bisley.csv"), na = c("NA"))
BQ2_data <- read_csv(here("data", "QuebradaCuenca2-Bisley.csv"), na = c("NA"))
BQ3_data <- read_csv(here("data", "QuebradaCuenca3-Bisley.csv"), na = c("NA"))
PRM_data <- read_csv(here("data", "RioMameyesPuenteRoto.csv"), , na = c("NA"))

#               filter for necessarily columns                ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

full_data <- rbind(BQ1_data, BQ2_data, BQ3_data, PRM_data)







#               MOVING AVERAGE ATTEMPTS                      ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# new column for days of year 
data_d <- full_data %>%  #using the sample_date to create a new column where the days are counted
  mutate(day_number = lubridate::yday(sample_date))



# for the individual data frames
BQ1_day <- BQ1_data %>% 
  mutate(day_number = lubridate::yday(sample_date))





#..................***Function that we created in class ...............
moving_avg <- function(focal_date, dates, conc, window_size_wk) {
  
  is_in_window <- (dates >= focal_date - (window_size_wk / 2) * 7) & 
    (dates <= focal_date + (window_size_wk / 2) * 7) 
  
  window_con <- conc[is_in_window]
  
  result <- mean(window_con)
  
  return(result)
  
}

#an example
moving_avg_func(focal_date = "1990-09-11", 
                dates = c("1990-09-12", "1992-02-11", "1990-08-20", "1990-10-01"), 
                conc = c(.13, 0.5, 0.67, 0.23), 
                window_size_wk = 9)


# apply to the entire set 
k_Q1_ma <- sapply(BQ1_data$sample_date, 
                  moving_avg, 
                  dates = BQ1_data$sample_date, 
                  conc = BQ1_data$k,
                  window_size_wk = 9)



BQ1_data1 <- BQ1_data %>% mutate(k_ma = k_Q1_ma)

ggplot(BQ1_data1, 
       aes(x = sample_date, 
           y = k_ma)) + 
  geom_line()



#       Applying the moving average function to the data sets          ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#.... Finding the moving average for all chem concentrations in BQ1 site  .....

k_Q1_ma <- sapply(BQ1_data$sample_date, 
                  moving_avg_func, 
                  dates = BQ1_data$sample_date, 
                  conc = BQ1_data$k,
                  window_size_wk = 9)

no3n_Q1_ma <- sapply(BQ1_data$sample_date, 
                     moving_avg_func, 
                     dates = BQ1_data$sample_date, 
                     conc = BQ1_data$no3_n,
                     window_size_wk = 9)


mg_Q1_ma <- sapply(BQ1_data$sample_date, 
                   moving_avg_func, 
                   dates = BQ1_data$sample_date, 
                   conc = BQ1_data$mg,
                   window_size_wk = 9)

ca_Q1_ma <- sapply(BQ1_data$sample_date, 
                   moving_avg_func, 
                   dates = BQ1_data$sample_date, 
                   conc = BQ1_data$ca,
                   window_size_wk = 9)

nh4n_Q1_ma <- sapply(BQ1_data$sample_date, 
                     moving_avg_func, 
                     dates = BQ1_data$sample_date, 
                     conc = BQ1_data$nh4_n,
                     window_size_wk = 9)

#.... Finding the moving average for all chem concentrations in BQ1 site  .....


#         Adding all the moving average to the data frames             ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
BQ1_data <- BQ1_data %>% 
  mutate(k_ma = k_Q1_ma, 
         no3n_ma = no3n_Q1_ma,
         mg_ma = mg_Q1_ma, 
         ca_ma = ca_Q1_ma, 
         nh4n_ma = nh4n_Q1_ma)

BQ1_data <- BQ1_data %>% 
  (mutate(
    k_ma = sapply(BQ1_data$sample_date, 
                  moving_avg_func, 
                  dates = BQ1_data$sample_date, 
                  conc = BQ1_data$k,
                  window_size_wk = 9),
    no3n_ma = sapply(BQ1_data$sample_date, 
                     moving_avg_func, 
                     dates = BQ1_data$sample_date, 
                     conc = BQ1_data$no3_n,
                     window_size_wk = 9), 
    mg_ma = sapply(BQ1_data$sample_date, 
                   moving_avg_func, 
                   dates = BQ1_data$sample_date, 
                   conc = BQ1_data$mg,
                   window_size_wk = 9), 
    ca_ma = sapply(BQ1_data$sample_date, 
                   moving_avg_func, 
                   dates = BQ1_data$sample_date, 
                   conc = BQ1_data$ca,
                   window_size_wk = 9), 
    nh4n_ma = sapply(BQ1_data$sample_date, 
                     moving_avg_func, 
                     dates = BQ1_data$sample_date, 
                     conc = BQ1_data$nh4_n,
                     window_size_wk = 9)
  ))







#..............................For Loop1............................


data_vec <- BQ1_data$k

window_size <- 8  #4 weeks before and 4 weeks after the center point


moving_avg_result <- (numeric(length(BQ1_data$k) - window_size + 1)) #empty vector to store the moving average results 


for(i in 1:(length(BQ1_data$k) - window_size + 1)) {  # make the starting place be where the window starts (need to accumulate the prior data to make the average)
  current_window <- BQ1_data$k[i:(i + window_size - 1)]   # looking at all the data in window 
  moving_avg_result[i] <- mean(current_window, na.rm = TRUE) # taking the mean of the data in the window
}


BQ1_data <- mutate(BQ1_data, moving_avg = moving_avg_result) #first 7 and last 7 don't have average values. Therefore, because the lengths do not add up, we can NOT join the data 




#..........................For Loop2..........................

d <- full_data %>%  #added a column with the month specified 
  mutate(day_number = lubridate::month(sample_date))

BQ1_day %>% 
  for(i in BQ1_day) {
    
    date_prior <- sample_date[i] - day(28)
    date_after <- sample_date[i] + day(28)
  }


start_window <- sample_date(28) #trying to make a start and end window 
end_window <- sample_date(28)





#..................***Function & For Loop: Keep working with this***..........

#put in 1 date and it finds the moving average of 28 days before and after date  
d_function <- function(d) { 
  
  total_sum <- 0 # creating empty vectors in the function
  total <- 0
  dd <- as.Date(d) # make sure d is being read as a date 
  
  for(i in 1:nrow(BQ1_day))  # iterating thru the day column 
    if (BQ1_day$sample_date[i] >= dd - weeks(4) & BQ1_day$sample_date[i] <= dd + weeks(4)) { 
      #it will only continue with the next step if sample_date is 28 days before or after 
      sum <- sum + BQ1_day$k[i] # sum of all k's in the time window 
      total <- total + 1 # total number of samples in the time window 
      result <- sum/total #take this away
    } 
  
  return(result) # solving for the average 
  # it will work when return(BQ1_day[500, 4])
  
}

d_function(d = "1992-08-18") # trying the function 


# sapply function to each date in the row 

sapply(BQ1_day$sample_date, d_function) #WORKING but super slow 


# try to make this function with purr:mdl

BQ1_data[["sample_date"]] %>% 
  map_dbl(.f = d_function)


map_dbl(.x = BQ1_data, 
        .f = ~ mean(.x, na.rm = TRUE)) # create my OWN function for rolling mean with a vector to apply across all columns 


map_dbl(BQ1_data, ~ if {.x - weeks(4) & .x + weeks(4)})



map_dbl(~ if (sample_date >= .x - weeks(4) & sample_date <= .x + weeks(4)) 
  d_function)


BQ1_data %>% 
  map_dbl(sample_date ~ if(BQ1_data$sample_date >= .x - weeks(4) & BQ1_data$sample_date <= .x + weeks(4))
  )




# scratch work 
if {
  sample_date >= sample_date + day(28) & sample_date <= sample_date + day(28)
}
}
if {
  sample_date >= sample_date + day(28) & sample_date <= sample_date + day(28)
})




#..........................Purr::map_dbl Attempt (didn't work)....................

number_of_days <- 56 #28 days before and 28 days after center point

data_vec <- BQ1_data$k


purr_results <- BQ1_data %>% 
  mutate(avg_28d_before_after= purrr::map_dbl(sample_date ~ { #map_dbl applys a function to each element of a list or vector  
    start_window <- .$k - sample_date(28) #trying to make a start and end window 
    end_window <- .$k + sample_date(28)
    
    subset_data <- BQ1_day %>% 
      filter(sample_date >= start_window & sample_date <= end_window) 
    
    if(nrow(subset_data) == 0) { #trying to handle values with no data in the window
      return(NA_real_)
    } else {
      return(mean(subset_data, na.rm = TRUE))
    }
  })
  
  
  
  
  
  #...................Rollmean Function..........................
  rollmean_data <- data_d %>% 
    mutate(roll_mean = rollmean(k, k = 2.25, fill = NA))
  
  
  
  
  
  
  
  #...............TTR attempt: worked but not right ...................
  # TTR::SMA function  
  
  library(TTR)
  BQ1_clean <- BQ1_data %>% 
    select("sample_id", "sample_date", "k") %>%  #select just potassium 
    na.omit(BQ1_data[4])  #omit NAs in data frame because the function won't go with NAs "Error in runSum(x, n) : Series contains non-leading NAs"
  
  BQ1_SMA1 <-SMA(as.numeric(BQ1_clean$k), n = 100) #use SMA to find the moving average 50 units above and 50 units below 
  
  BQ1_SMA <- mutate(BQ1_clean, SMA = BQ1_SMA1) #put the SMA vector into the cleaned data with no NAs
  
  SMA_plot <- ggplot(BQ1_SMA, 
                     aes(x = sample_date, 
                         y = SMA)) + 
    geom_line()
  
  
  
  
  
  
  #..........................Graphing...........................
  ggplot(data = BQ1_data, 
         aes(x = sample_date, 
             y = k)) + 
    geom_line() 
  
  ggplot(data = BQ1_data, 
         aes(x = sample_date, 
             y = k)) + 
    geom_line()
  
  
  
  
  
  