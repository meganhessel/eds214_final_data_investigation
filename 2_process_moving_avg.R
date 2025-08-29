##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##--------- APPLYING THE MOVING AVERAGE (ma) FUNCTION TO ALL DATA SETS ---------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Applies the moving average function to the chemical concentration (K, Mg, Ca, NO3-N, NH4-N) for each site (BQ1, BQ2, BQ3, PRM) and adds the newly calculate ma into a new column. 


# Loading the moving average function 
source(here::here("R", "moving_avg_func.R"))


#..........................For BQ1 Site..........................
BQ1_data_ma <- BQ1_data %>% 
  mutate(   # creates new columns in the data frame 
  k_ma = sapply(sample_date,   # the function is applied to all sample dates
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


#..........................For BQ2 Site..........................
BQ2_data_ma <- BQ2_data %>% 
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


#..........................For BQ3 Site..........................
BQ3_data_ma <- BQ3_data %>% 
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

#..........................For PRM Site.......................... 
PRM_data_ma <- PRM_data %>% 
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


#................................................................ 

# saving all the new data frames in output folder 
saveRDS(BQ1_data_ma, 
        file = here("outputs", "BQ1.rds"))
saveRDS(BQ2_data_ma, 
        file = here("outputs", "BQ2.rds"))
saveRDS(BQ3_data_ma, 
        file = here("outputs", "BQ3.rds"))
saveRDS(PRM_data_ma, 
        file = here("outputs", "PRM.rds"))


# combining the moving average data into 1 data frame 
full_data <- rbind(BQ1_data_ma, BQ2_data_ma, BQ3_data_ma, PRM_data_ma)

# save the full data frame in output folder
saveRDS(full_data, 
        file = here("outputs", "river_df.rds"))
