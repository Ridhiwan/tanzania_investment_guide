library(tidyverse)
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

tzeco2mixx$lat[tzeco2mixx$area == "Dar-es-Salaam"] <- -6.823074
tzeco2mixx$lng[tzeco2mixx$area == "Dar-es-Salaam"] <- 39.209116
tzeco2mixx$lat[tzeco2mixx$area == "Tanga"] <- -5.291219
tzeco2mixx$lng[tzeco2mixx$area == "Tanga"] <- 38.223867
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
tzeco2mixx$lat[tzeco2mixx$area == "Kigoma"] <- -4.675572
tzeco2mixx$lng[tzeco2mixx$area == "Kigoma"] <- 30.306029
tzeco2mixx$lat[tzeco2mixx$area == "Morogoro"] <- -6.830373
tzeco2mixx$lng[tzeco2mixx$area == "Morogoro"] <- 37.670589
tzeco2mixx$lat[tzeco2mixx$area == "Tanzania"] <- -6.776012
tzeco2mixx$lng[tzeco2mixx$area == "Tanzania"] <- 39.178326

Kagera <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Kagera$area[Kagera$area == "France"] <- "Kagera"
Kagera$lat[Kagera$area == "Kagera"] <- -1.916663
Kagera$lng[Kagera$area == "Kagera"] <- 31.2999988
tzeco2mixx <- rbind2(tzeco2mixx,Kagera)
Mara <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Mara$area[Mara$area == "France"] <- "Mara"
Mara$lat[Mara$area == "Mara"] <- -1.83333
Mara$lng[Mara$area == "Mara"] <- 34.41667
tzeco2mixx <- rbind2(tzeco2mixx,Mara)
Simiyu <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Simiyu$area[Simiyu$area == "France"] <- "Simiyu"
Simiyu$lat[Simiyu$area == "Simiyu"] <- -3.004841
Simiyu$lng[Simiyu$area == "Simiyu"] <- 34.276829
tzeco2mixx <- rbind2(tzeco2mixx,Simiyu)
Geita <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Geita$area[Geita$area == "France"] <- "Geita"
Geita$lat[Geita$area == "Geita"] <- -2.86667
Geita$lng[Geita$area == "Geita"] <- 32.16667
tzeco2mixx <- rbind2(tzeco2mixx,Geita)
Manyara <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Manyara$area[Manyara$area == "France"] <- "Manyara"
Manyara$lat[Manyara$area == "Manyara"] <- -4.749997
Manyara$lng[Manyara$area == "Manyara"] <- 36.666664
tzeco2mixx <- rbind2(tzeco2mixx,Manyara)
Singida <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Singida$area[Singida$area == "France"] <- "Singida"
Singida$lat[Singida$area == "Singida"] <- -4.81629
Singida$lng[Singida$area == "Singida"] <- 34.74358
tzeco2mixx <- rbind2(tzeco2mixx,Singida)
Pwani <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Pwani$area[Pwani$area == "France"] <- "Pwani"
Pwani$lat[Pwani$area == "Pwani"] <- -7.872839
Pwani$lng[Pwani$area == "Pwani"] <- 38.815894
tzeco2mixx <- rbind2(tzeco2mixx,Pwani)
Lindi <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Lindi$area[Lindi$area == "France"] <- "Lindi"
Lindi$lat[Lindi$area == "Lindi"] <- -9.514464
Lindi$lng[Lindi$area == "Lindi"] <- 38.383706
tzeco2mixx <- rbind2(tzeco2mixx,Lindi)
Ruvuma <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Ruvuma$area[Ruvuma$area == "France"] <- "Ruvuma"
Ruvuma$lat[Ruvuma$area == "Ruvuma"] <- -11.0
Ruvuma$lng[Ruvuma$area == "Ruvuma"] <- 36.0
tzeco2mixx <- rbind2(tzeco2mixx,Ruvuma)
Rukwa <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Rukwa$area[Rukwa$area == "France"] <- "Rukwa"
Rukwa$lat[Rukwa$area == "Rukwa"] <-  -7.507073
Rukwa$lng[Rukwa$area == "Rukwa"] <- 31.000140
tzeco2mixx <- rbind2(tzeco2mixx,Rukwa)
Njombe <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Njombe$area[Njombe$area == "France"] <- "Njombe"
Njombe$lat[Njombe$area == "Njombe"] <- -9.33333
Njombe$lng[Njombe$area == "Njombe"] <- 34.76667
tzeco2mixx <- rbind2(tzeco2mixx,Njombe)
Katavi <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Katavi$area[Katavi$area == "France"] <- "Katavi"
Katavi$lat[Katavi$area == "Katavi"] <- -6.4
Katavi$lng[Katavi$area == "Katavi"] <- 31.33333
tzeco2mixx <- rbind2(tzeco2mixx,Katavi)
Kilimanjaro <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Kilimanjaro$area[Kilimanjaro$area == "France"] <- "Kilimanjaro"
Kilimanjaro$lat[Kilimanjaro$area == "Kilimanjaro"] <- -3.075333032
Kilimanjaro$lng[Kilimanjaro$area == "Kilimanjaro"] <-  37.354831914
tzeco2mixx <- rbind2(tzeco2mixx,Kilimanjaro)
Dodoma <- eco2mix %>% drop_na() %>% filter(area == "France") %>% select(-c(balanceUK,balanceES,balanceIT, balanceCH,balanceDEBE, import,export))
Dodoma$area[Dodoma$area == "France"] <- "Dodoma"
Dodoma$lat[Dodoma$area == "Dodoma"] <- -5.634214
Dodoma$lng[Dodoma$area == "Dodoma"] <- 36.025128
tzeco2mixx <- rbind2(tzeco2mixx,Dodoma)

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

renewable2016 <- prod2016 %>% select(hydraulic, solar, wind)
colors <- c("#3093e5", "#fcba50", "#a0d9e8")
basemap %>%
addMinicharts(
prod2016$lng, prod2016$lat,
chartdata = renewable2016,
colorPalette = colors,
width = 45, height = 45
)

basemap %>%
addMinicharts(
prod2016$lng, prod2016$lat,
chartdata = prod2016$load,
showLabels = TRUE,
width = 45
)

prodRegions <- tzeco2mixx %>% filter(area != "Tanzania")
basemap %>%
addMinicharts(
prodRegions$lng, prodRegions$lat,
chartdata = prodRegions[, c("hydraulic", "solar", "wind")],
time = prodRegions$month,
colorPalette = colors,
width = 45, height = 45
)

