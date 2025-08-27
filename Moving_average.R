# This script defines the moving average function used for the time series, and applied it each site (BQ1, BQ2, BQ3, PRM) and chemical concentration (K, Mg, Ca, NO3-N, NH4-N). 


#               MOVING AVERAGE FUNCTION                      ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Description: To find the moving average at each date, the moving_avg_func will look at each date as the "focal date" and determine which sample dates are within the time window of interest (window_size_wk). Then, the function will calculate and output the average of the chemical concentrations within the window time frame. 


moving_avg_func <- function(focal_date, dates, conc, window_size_wk) {
  # is_in_window asks what other dates are within the time window 
  is_in_window <- (dates >= focal_date - (window_size_wk / 2) * 7) & 
    (dates <= focal_date + (window_size_wk / 2) * 7) 
  # window_conc will accumulate the chemical concentrations associated with all sample dates in the time window  
  window_con <- conc[is_in_window]
  # Lastly, the function will produce a single numeric variable which is the mean of all concentrations in the focal date's time window. 
  result <- mean(window_con)
  return(result)
  
}




#       Applying the moving average function to the data sets          ~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# The task objective is to 
k_Q1_ma <- sapply(BQ1_data$sample_date, 
                  moving_avg, 
                  dates = BQ1_data$sample_date, 
                  conc = BQ1_data$k,
                  window_size_wk = 9)

BQ1_data1 <- BQ1_data %>% mutate(k_ma = k_Q1_ma)
