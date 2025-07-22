## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(commecometrics)
library(ggplot2)
library(sf)

## ----set-working-directory, echo=FALSE, eval = FALSE--------------------------
# options(timeout = 600)
# download.file("https://ndownloader.figshare.com/files/56228033", destfile = "data.zip", mode = "wb")
# unzip("data.zip")

## ----eval = FALSE-------------------------------------------------------------
# samplingPoints <- read.csv("data/sampling_points.csv")
# traits <- read.csv("data/traits.csv")
# fossils <- read.csv("data/fossil_RBL.csv")
# head(fossils)

## ----load-shapefile, message = FALSE, eval = FALSE----------------------------
# geography <- sf::st_read("data/data_0.shp", quiet = TRUE)
# geography$SCI_NAME <- gsub(" ", "_", geography$SCI_NAME)

## ----eval = FALSE-------------------------------------------------------------
# traitsByPoint <- summarize_traits_by_point(
#   points_df = samplingPoints,
#   trait_df = traits,
#   species_polygons = geography,
#   trait_column = "RBL",
#   species_name_col = "SCI_NAME",
#   continent = FALSE,
#   parallel = FALSE
# )

## ----eval = FALSE-------------------------------------------------------------
# ecoModel <- ecometric_model(
#   points_df = traitsByPoint$points,
#   env_var = "precip",
#   transform_fun = function(x) log(x + 1),
#   inv_transform_fun = function(x) exp(x) - 1,
#   grid_bins_1 = 25,
#   grid_bins_2 = 25,
#   min_species = 3
# )
# 
# summary(ecoModel$model)
# 
# print(ecoModel$correlation)

## ----fig.width=5, fig.height=4, eval = FALSE----------------------------------
# ecoPlot <- ecometric_space(
#   model_out = ecoModel,
#   env_name = "Precipitation (log)",
#   x_label = "Community mean",
#   y_label = "Community standard deviation"
# )
# 
# print(ecoPlot)

## ----eval = FALSE-------------------------------------------------------------
# recon <- reconstruct_env(
#   fossildata = fossils,
#   model_out = ecoModel,
#   match_nearest = TRUE,
#   fossil_lon = "Long",
#   fossil_lat = "Lat",
#   modern_id = "GlobalID",
#   modern_lon = "Longitude",
#   modern_lat = "Latitude"
# )
# 
# head(recon[, c("Site", "fossil_env_est_UN", "fossil_minlimit_UN", "fossil_maxlimit_UN")])

## ----fig.width=5, fig.height=4, eval = FALSE----------------------------------
# fossilPlot <- ecometric_space(
#   model_out = ecoModel,
#   env_name = "Precipitation (log mm)",
#   fossil_data = recon,
#   x_label = "Community mean",
#   y_label = "Community standard deviation"
# )
# 
# print(fossilPlot)

