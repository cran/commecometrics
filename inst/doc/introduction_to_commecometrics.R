## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(commecometrics)
library(ggplot2)
library(sf)

## ----set-working-directory, eval = FALSE--------------------------------------
# options(timeout = 600)
# download.file("https://ndownloader.figshare.com/files/56228033", destfile = "data.zip", mode = "wb")
# unzip("data.zip")

## ----eval = FALSE-------------------------------------------------------------
# samplingPoints <- read.csv("data/sampling_points.csv")
# head(samplingPoints)
# traits <- read.csv("Data/traits.csv")
# head(traits)

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
# 
# head(traitsByPoint[[1]])

## ----eval = FALSE-------------------------------------------------------------
# ecoModel <- ecometric_model(
#   points_df = traitsByPoint$points,
#   env_var = "precip",
#   transform_fun = function(x) log(x + 1),
#   inv_transform_fun = function(x) exp(x) - 1,
#   min_species = 3
# )

## ----eval = FALSE-------------------------------------------------------------
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

## ----bin-count-subset, eval = FALSE-------------------------------------------
# ecoModel$diagnostics$bin_counts[35:45, 26:37]
# 
# head(ecoModel$eco_space)

## ----sensitivity-plot, fig.width=7.2, fig.height=6, warning=FALSE, message=FALSE, eval = FALSE----
# sensitivityResults <- sensitivity_analysis(
#   points_df = traitsByPoint$points,
#   env_var = "precip",
#   sample_sizes = seq(100, 1000, 100),
#   iterations = 5,
#   transform_fun = function(x) log(x + 1),
#   parallel = FALSE
# )
# 
# head(sensitivityResults$combined_results)
# 
# print(sensitivityResults$summary_results)

## ----eval = FALSE-------------------------------------------------------------
# table(samplingPoints$VegSimple)
# 
# samplingPoints$VegSimple <- factor(samplingPoints$VegSimple,
#                    levels = 1:5,
#                    labels = c("Arctic", "Deciduous", "Desert", "Evergreen", "Grassland"))
# 
# 
# ecoModelQual <- ecometric_model_qual(
#   points_df = traitsByPoint$points,
#   category_col = "VegSimple",
#   min_species = 3
# )

## ----message=FALSE, warning=FALSE, fig.width=5, fig.height=4, eval = FALSE----
# ecoPlotQual <- ecometric_space_qual(
#   model_out = ecoModelQual,
#   x_label = "Community mean",
#   y_label = "Community standard deviation"
# )
# 
# print(ecoPlotQual$ecometric_space_plot)  # Qualitative model
# print(ecoPlotQual$probability_maps$Grassland)  # One of the category-specific maps

## ----fig.width=7.2, fig.height=6, warning=FALSE, message=FALSE, eval = FALSE----
# sensitivityQual <- sensitivity_analysis_qual(
#   points_df = traitsByPoint$points,
#   category_col = "VegSimple",
#   sample_sizes = seq(100, 1000, 100),
#   iterations = 10,
#   parallel = FALSE
# )
# 
# print(sensitivityQual$summary_results)

