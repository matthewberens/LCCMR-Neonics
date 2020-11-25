##============================================================================
# Script Environment for Neonicotinoid Analysis
##=============================================================================

library(ggplot2)
library(tidyr)

##===========================================================================
# Load in and sort the data
##===========================================================================

planktonLCCMR <- read.csv("planktonLCCMR.csv")

planktonLCCMR <- planktonLCCMR[- grep("NaN", planktonLCCMR$species),] # remove blank rows

phytoplankton <- filter(planktonLCCMR, planktonType == "phytoplankton") # extract phyto
zooplankton <- filter(planktonLCCMR, planktonType == "zooplankton") # extract zoop

##===========================================================================
# Make some plots!
##===========================================================================

phytoplankton %>% ggplot(aes(date, value)) +
  theme_bw() +
  geom_line(aes(color = group)) +
  facet_grid(group~., scales = "free_y") +
  guides(color = "none")

zooplankton %>% ggplot(aes(date, value)) +
  theme_bw() +
  geom_line(aes(color = species)) +
  facet_grid(species~., scales = "free_y") +
  guides(color = "none")
