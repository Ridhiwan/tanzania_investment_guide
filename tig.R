library(tidyverse)
install.packages("leaflet.minicharts")
library(leaflet.minicharts)
library(leaflet)
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
tzeco2mixx$area[tzeco2mixx$area == "France"] <- "Tanzania"

tzeco2mixx$lat[tzeco2mixx$area == "Dar-es-Salaam"] <- -6.776012
tzeco2mixx$lng[tzeco2mixx$area == "Dar-es-Salaam"] <- 39.178326
tzeco2mixx$lat[tzeco2mixx$area == "Tanga"] <- -5.06893
tzeco2mixx$lng[tzeco2mixx$area == "Tanga"] <- 39.09875
tzeco2mixx$lat[tzeco2mixx$area == "Iringa"] <- -7.773094
tzeco2mixx$lng[tzeco2mixx$area == "Iringa"] <- 35.699120
tzeco2mixx$lat[tzeco2mixx$area == "Mwanza"] <- -2.51667
tzeco2mixx$lng[tzeco2mixx$area == "Mwanza"] <- 32.9
tzeco2mixx$lat[tzeco2mixx$area == "Mtwara"] <- -10.26667
tzeco2mixx$lng[tzeco2mixx$area == "Mtwara"] <- 40.18333
tzeco2mixx$lat[tzeco2mixx$area == "Arusha"] <- -3.386925
tzeco2mixx$lng[tzeco2mixx$area == "Arusha"] <- 36.682995
tzeco2mixx$lat[tzeco2mixx$area == "Shinyanga"] <- -3.680996
tzeco2mixx$lng[tzeco2mixx$area == "Shinyanga"] <- 33.427139
tzeco2mixx$lat[tzeco2mixx$area == "Zanzibar"] <- -6.1333328
tzeco2mixx$lng[tzeco2mixx$area == "Zanzibar"] <- 39.3166654
tzeco2mixx$lat[tzeco2mixx$area == "Mbeya"] <- -8.909401
tzeco2mixx$lng[tzeco2mixx$area == "Mbeya"] <- 33.460773
tzeco2mixx$lat[tzeco2mixx$area == "Tabora"] <- -5.030461
tzeco2mixx$lng[tzeco2mixx$area == "Tabora"] <- 32.819431
tzeco2mixx$lat[tzeco2mixx$area == "Kigoma"] <- -4.893941
tzeco2mixx$lng[tzeco2mixx$area == "Kigoma"] <- 29.673386
tzeco2mixx$lat[tzeco2mixx$area == "Morogoro"] <- -6.830373
tzeco2mixx$lng[tzeco2mixx$area == "Morogoro"] <- 37.670589
tzeco2mixx$lat[tzeco2mixx$area == "Tanzania"] <- -6.776012
tzeco2mixx$lng[tzeco2mixx$area == "Tanzania"] <- 39.178326


prod2016 <- tzeco2mixx %>%
mutate(
renewable = bioenergy + solar + wind + hydraulic,
non_renewable = total - bioenergy - solar - wind - hydraulic
) %>%
filter(grepl("2016", month) & area != "Tanzania") %>%
select(-month) %>%
group_by(area, lat, lng) %>%
summarise_all(sum) %>%
ungroup()

tilesURL <- "http://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"
basemap <- leaflet(width = "100%", height = "400px") %>%
addTiles(tilesURL)

colors <- c("#4fc13c", "#cccccc")
basemap %>%
addMinicharts(
prod2016$lng, prod2016$lat,
type = "pie",
chartdata = prod2016[, c("renewable", "non_renewable")],
colorPalette = colors,
width = 60 * sqrt(prod2016$total) / sqrt(max(prod2016$total)), transitionTime = 0
)
