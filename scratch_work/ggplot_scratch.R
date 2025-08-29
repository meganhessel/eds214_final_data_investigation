##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            --
##-------- CREATING THE TIME SERIES PLOT FROM THE MOVING AVERAGES --------------
##                                                                            --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#..........Creating the graphs all together   ................

full_long <- full_data %>% 
  pivot_longer(cols = k_ma:nh4n_ma, 
               names_to = "nutrients", 
               values_to = "concentration")

ggplot(full_long, 
       aes(x = sample_date, 
           y = concentration, 
           color = sample_id)) + 
  geom_line() + 
  facet_wrap(~nutrients)

#....................Creating the individual graphs  .............................

hurrican_year <- as.Date("1989-09-18") #defining the hurrican year 

# potassium graph 
k_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = k_ma, 
            color = sample_id)) + 
  geom_line() + 
  theme(axis.title.x = element_blank(), 
        axis.text.x = element_blank(), 
        legend.position = "none") +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "K mg l^(-1)", 
       title = "Chemical Concentrations in Bisley, Puerto Rico Streams", 
       subtitle = "Before and after Hurricane Hugo") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))



k_plot


# NO3-N graph 
no3n_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = no3n_ma, 
            color = sample_id)) + 
  geom_line() + 
  theme(axis.title.x = element_blank(), 
        axis.text.x = element_blank()) +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "NO3-N ug^ (-1)", 
       color = "Streams") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))


no3n_plot

# Magnesium graph 
mg_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = mg_ma, 
            color = sample_id)) + 
  geom_line() +   
  theme(axis.title.x = element_blank(), 
                        axis.text.x = element_blank(), 
                        legend.position = "none") +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "Mg mg l^(-1)") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))


mg_plot

# Calcium graph 
ca_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = ca_ma, 
            color = sample_id)) + 
  geom_line()+   
  theme(axis.title.x = element_blank(), 
        axis.text.x = element_blank(), 
        legend.position = "none") +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "Ca mg l^(-1)") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))


ca_plot

#NH4-N graph 
nh4n_plot <- ggplot(full_data, 
       aes (x = sample_date, 
            y = nh4n_ma, 
            color = sample_id)) + 
  geom_line() + 
  theme(axis.title.x = element_blank(), 
        legend.position = "none") +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "NH4-N ug^(-1)",
       x = "Years") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))


nh4n_plot
#..........................  Combining the graphs  .............................


library(patchwork) # load the library that allows plots to be on top of each other 
time_series_plot <- (k_plot / no3n_plot / mg_plot / ca_plot / nh4n_plot)

time_series_plot



#..........................  HUGE GRAPH  .............................

library(ggplot2)

#defining the hurricane year 
hurrican_year <- as.Date("1989-09-18")

#...................Creating the individual graphs ......................

# Potassium graph 
k_plot <- ggplot(full_data, 
                 aes (x = sample_date, 
                      y = k_ma, 
                      color = sample_id)) + 
  geom_line() + 
  theme(axis.title.x = element_blank(), 
        axis.text.x = element_blank(), 
        legend.position = "none", 
        axis.text.y = element_text(size = 13), 
        axis.title.y = element_text(size = 18), 
        title = element_text(size = 23), 
        plot.caption = element_text(size = 14)) +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "K mg l^(-1)", 
       title = "Chemical Concentrations in Bisley, Puerto Rico Streams", 
       subtitle = "Before and after Hurricane Hugo", 
       caption = "(a)") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))


# NO3-N graph 
no3n_plot <- ggplot(full_data, 
                    aes (x = sample_date, 
                         y = no3n_ma, 
                         color = sample_id)) + 
  geom_line() + 
  theme(axis.title.x = element_blank(), 
        axis.text.x = element_blank(), 
        axis.text.y = element_text(size = 12), 
        axis.title.y = element_text(size = 17), 
        legend.text = element_text(size = 14), 
        legend.title = element_text(size = 17), 
        plot.caption = element_text(size = 14)) +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "NO3-N ug^(-1)", 
       color = "Streams", 
       caption = "(b)") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))

# Magnesium graph 
mg_plot <- ggplot(full_data, 
                  aes (x = sample_date, 
                       y = mg_ma, 
                       color = sample_id)) + 
  geom_line() +   
  theme(axis.title.x = element_blank(), 
        axis.text.x = element_blank(), 
        legend.position = "none", 
        axis.text.y = element_text(size = 13), 
        axis.title.y = element_text(size = 18), 
        plot.caption = element_text(size = 14)) +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "Mg mg l^(-1)", 
       caption = "(c)") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))


# Calcium graph 
ca_plot <- ggplot(full_data, 
                  aes (x = sample_date, 
                       y = ca_ma, 
                       color = sample_id)) + 
  geom_line()+   
  theme(axis.title.x = element_blank(), 
        axis.text.x = element_blank(), 
        legend.position = "none", 
        axis.text.y = element_text(size = 13), 
        axis.title.y = element_text(size = 18), 
        plot.caption = element_text(size = 14)) +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "Ca mg l^(-1)", 
       caption = "(d)") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6"))


#NH4-N graph 
nh4n_plot <- ggplot(full_data, 
                    aes (x = sample_date, 
                         y = nh4n_ma, 
                         color = sample_id)) + 
  geom_line() + 
  theme(legend.position = "none", 
        axis.text.y = element_text(size = 13), 
        axis.title.y = element_text(size = 18), 
        axis.text.x = element_text(size = 20), 
        plot.caption = element_text(size = 14),
        axis.title.x = element_text(size = 21)) +
  geom_vline(xintercept = hurrican_year, color = "darkgrey", linetype = "dashed") +
  labs(y = "NH4-N ug^(-1)",
       x = "Years",
       caption = "(e)") + 
  scale_color_manual(values = c("#D8AEDDFF", "#81C14B", "#F5D000FF", "#00A6A6")) 



#.................. Combining the graphs .......................


library(patchwork) # load the library that allows plots to be on top of each other 
time_series_plot <- (k_plot / no3n_plot / mg_plot / ca_plot / nh4n_plot)

time_series_plot

ggsave(here("figs", "time_series_plot_BIG.png"), height = 15, width = 15)
