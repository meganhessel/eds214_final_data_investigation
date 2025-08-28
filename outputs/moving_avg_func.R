#' Moving Average Function
#'
#' @param focal_date: Single date which would be the center of the time window.
#' @param dates: A vector of sample dates. 
#' @param conc: A vector of chemical concentrations that corresponds to the sample dates. 
#' @param window_size_wk: Single number that determines the period of time the function takes in observations. The window size established time boundaries. 
#' 
#'
#' @returns Returns the average of all chemical concentrations within the window time frame.
#' @export
#'
#' @examples:
#' moving_avg_func(focal_date = "1990-09-11",
#'      dates = c("1990-09-12", "1992-02-11", "1990-08-20", "1990-10-01"),
#'      conc = c(.13, 0.5, 0.67, 0.23),
#'      window_size_wk = 9)

moving_avg_func <- function(focal_date, dates, conc, window_size_wk) {
  focal_date <- as.Date(focal_date)
  # is_in_window asks what other dates in the vector are within the time window 
  is_in_window <- (dates >= focal_date - (window_size_wk / 2) * 7) & 
    (dates <= focal_date + (window_size_wk / 2) * 7) 
  # window_conc will accumulate the chemical concentrations associated with all sample dates in the time window  
  window_con <- conc[is_in_window]
  # Lastly, the function will produce a single numeric variable which is the mean of all concentrations in the focal date's time window. 
  result <- mean(window_con, na.rm = TRUE)
  return(result)
  
}

