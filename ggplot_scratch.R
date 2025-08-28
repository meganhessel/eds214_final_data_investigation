##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##-------- CREATING THE TIME SERIES PLOT FROM THE MOVING AVERAGES --------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#..................... Combining all the data sets .............................
full_data <- rbind(BQ1_data, BQ2_data, BQ3_data, PRM_data)



#....................Creating the individual graphs  .............................

# potassium graph 
k_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = k_ma, 
            color = sample_id)) + 
  geom_line()

# NO3-N graph 
no3n_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = no3n_ma, 
            color = sample_id)) + 
  geom_line()

# Magnesium graph 
mg_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = mg_ma, 
            color = sample_id)) + 
  geom_line()

# Calcium graph 
ca_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = ca_ma, 
            color = sample_id)) + 
  geom_line()

#NH4-N graph 
nh4n_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = nh4n_ma, 
            color = sample_id)) + 
  geom_line()


#..........................  Combining the graphs  .............................


library(patchwork) # load the library that allows plots to be on top of each other 
time_series_plot <- (k_plot / no3n_plot / mg_plot / ca_plot / nh4n_plot)
