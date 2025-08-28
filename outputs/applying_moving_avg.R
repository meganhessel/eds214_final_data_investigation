##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##--------- APPLYING THE MOVING AVERAGE FUNCTION TO ALL DATA SETS --------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# This script applies the moving average function to each site (BQ1, BQ2, BQ3, PRM) and chemical concentration (K, Mg, Ca, NO3-N, NH4-N). 


#..... Finding the moving average for all chem concentrations in BQ1 site  .....
#....... And creating a new column for each calculated moving average ..........

#.... Finding the moving average for all chem concentrations in the BQ1 site  .....

BQ1_data <- BQ1_data %>% 
  mutate(   # creates new columns in the data frame 
  k_ma = sapply(sample_date,   # the function is applied to all dates in the sample dates 
                moving_avg_func,   # using the moving average function 
                dates = sample_date,   # looks across all sample dates to find the rows that fit the time window 
                conc = k,   # averages the potassium concentrations 
                window_size_wk = 9),   # takes the moving avg with a window of 9 weeks
  no3n_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = no3_n,
                   window_size_wk = 9), 
  mg_ma = sapply(sample_date, 
                 moving_avg_func, 
                 dates = sample_date, 
                 conc = mg,
                 window_size_wk = 9), 
  ca_ma = sapply(sample_date, 
                 moving_avg_func, 
                 dates = sample_date, 
                 conc = ca,
                 window_size_wk = 9), 
  nh4n_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = nh4_n,
                   window_size_wk = 9))


#.... Finding the moving average for all chem concentrations in the BQ2 site  .....

BQ2_data <- BQ2_data %>% 
  mutate(
    k_ma = sapply(sample_date, 
                  moving_avg_func, 
                  dates = sample_date, 
                  conc = k,
                  window_size_wk = 9),
    no3n_ma = sapply(sample_date, 
                     moving_avg_func, 
                     dates = sample_date, 
                     conc = no3_n,
                     window_size_wk = 9), 
    mg_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = mg,
                   window_size_wk = 9), 
    ca_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = ca,
                   window_size_wk = 9), 
    nh4n_ma = sapply(sample_date, 
                     moving_avg_func, 
                     dates = sample_date, 
                     conc = nh4_n,
                     window_size_wk = 9))

#.... Finding the moving average for all chem concentrations in the BQ3 site  .....

BQ3_data <- BQ3_data %>% 
  mutate(
    k_ma = sapply(sample_date, 
                  moving_avg_func, 
                  dates = sample_date, 
                  conc = k,
                  window_size_wk = 9),
    no3n_ma = sapply(sample_date, 
                     moving_avg_func, 
                     dates = sample_date, 
                     conc = no3_n,
                     window_size_wk = 9), 
    mg_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = mg,
                   window_size_wk = 9), 
    ca_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = ca,
                   window_size_wk = 9), 
    nh4n_ma = sapply(sample_date, 
                     moving_avg_func, 
                     dates = sample_date, 
                     conc = nh4_n,
                     window_size_wk = 9))

#.... Finding the moving average for all chem concentrations in the PRM site  .....

PRM_data <- PRM_data %>% 
  mutate(
    k_ma = sapply(sample_date, 
                  moving_avg_func, 
                  dates = sample_date, 
                  conc = k,
                  window_size_wk = 9),
    no3n_ma = sapply(sample_date, 
                     moving_avg_func, 
                     dates = sample_date, 
                     conc = no3_n,
                     window_size_wk = 9), 
    mg_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = mg,
                   window_size_wk = 9), 
    ca_ma = sapply(sample_date, 
                   moving_avg_func, 
                   dates = sample_date, 
                   conc = ca,
                   window_size_wk = 9), 
    nh4n_ma = sapply(sample_date, 
                     moving_avg_func, 
                     dates = sample_date, 
                     conc = nh4_n,
                     window_size_wk = 9))

