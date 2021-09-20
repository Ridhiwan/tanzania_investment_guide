library(dplyr)
library(tidyverse)
install.packages("leaflet.minicharts")
library(leaflet.minicharts)
data("eco2mix")
tzeco2mix <- eco2mix %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
tzeco2mixx <- tzeco2mix %>% drop_na()

tzeco2mixx$area %>% unique()
tzeco2mixx$area[tzeco2mixx$area == "Auvergne-Rhone-Alpes"] <- "Dar-es-Salaam"
tzeco2mixx$area[tzeco2mixx$area == "Centre-Val de Loire"] <- "Mwanza"
tzeco2mixx$area[tzeco2mixx$area == "Hauts-de-France"] <- "Arusha"
tzeco2mixx$area[tzeco2mixx$area == "Hauts-de-France"] <- "Dodoma"
tzeco2mixx$area[tzeco2mixx$area == "Nouvelle-Aquitaine"] <- "Mbeya"
tzeco2mixx$area[tzeco2mixx$area == "Pays-de-la-Loire"] <- "Morogoro"
tzeco2mixx$area[tzeco2mixx$area == "Bourgogne-Franche-Comte"] <- "Tanga"
tzeco2mixx$area[tzeco2mixx$area == "Ile-de-France"] <- "Shinyanga"
tzeco2mixx$area[tzeco2mixx$area == "Occitanie"] <- "Tabora"
tzeco2mixx$area[tzeco2mixx$area == "Bretagne"] <- "Iringa"
tzeco2mixx$area[tzeco2mixx$area == "Grand-Est"] <- "Mtwara"
tzeco2mixx$area[tzeco2mixx$area == "Normandie"] <- "Zanzibar"
tzeco2mixx$area[tzeco2mixx$area == "PACA"] <- "Kigoma"

tzeco2mixx$lat[tzeco2mixx$lat == 45.51266] <- -6.776012
tzeco2mixx$lng[tzeco2mixx$lat == 4.5373376] <- 39.178326
tzeco2mixx$lat[tzeco2mixx$lat == 47.23433] <- -5.06893
tzeco2mixx$lng[tzeco2mixx$lat == 4.8074111] <- 39.09875
tzeco2mixx$lat[tzeco2mixx$lat == 48.17299] <- -7.773094
tzeco2mixx$lng[tzeco2mixx$lat == -2.8416205] <- 35.699120
tzeco2mixx$lat[tzeco2mixx$lat == 47.48480] <- -2.51667
tzeco2mixx$lng[tzeco2mixx$lat == 1.6851093] <- 32.9
tzeco2mixx$lat[tzeco2mixx$lat == 48.68889] <- -10.26667
tzeco2mixx$lng[tzeco2mixx$lat == 5.6138840] <- 40.18333
tzeco2mixx$lat[tzeco2mixx$lat == 49.96995] <- -3.386925
tzeco2mixx$lng[tzeco2mixx$lat == 2.7719446] <- 36.682995
tzeco2mixx$lat[tzeco2mixx$lat == 49.96995] <- -3.680996
tzeco2mixx$lng[tzeco2mixx$lat == 2.7719446] <- 33.427139
tzeco2mixx$lat[tzeco2mixx$lat == 48.70934] <- -6.1333328
tzeco2mixx$lng[tzeco2mixx$lat == 2.5040817] <- 39.3166654
tzeco2mixx$lat[tzeco2mixx$lat == -6.1333328] <- -3.680996
tzeco2mixx$lng[tzeco2mixx$lat == 39.3166654] <- 33.427139
tzeco2mixx$lat[tzeco2mixx$lat == 49.12033] <- -6.1333328
tzeco2mixx$lng[tzeco2mixx$lat == 0.1100208] <- 39.3166654
tzeco2mixx$lat[tzeco2mixx$lat == 45.20254] <- -8.909401
tzeco2mixx$lng[tzeco2mixx$lat == 0.2184833] <- 33.460773
tzeco2mixx$lat[tzeco2mixx$lat == 43.70243] <- -5.030461
tzeco2mixx$lng[tzeco2mixx$lat == 2.1459555] <- 32.819431
tzeco2mixx$lat[tzeco2mixx$lat == 43.95806] <- -4.893941
tzeco2mixx$lng[tzeco2mixx$lat == 6.0655043] <- 29.673386
tzeco2mixx$lat[tzeco2mixx$lat == 47.47930] <- -6.830373
tzeco2mixx$lng[tzeco2mixx$lat == -0.8132826] <- 37.670589

