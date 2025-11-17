#' `fxn_reporting.R` - Build information text for reporting tab
#' 
#' @param year - Year selection by user
#' @param legacyData - Output from `fxn_legacyData.R`
#' @param apiData - Output from `fxn_apiData.R`
#' @return `reporting` - Text for latest update information


fxn_reporting <- function(year, legacyData, apiData) {
  
  # Inputs -----
  
  if (lubridate::leap_year(as.integer(year)) == TRUE) {
    expectedDays <- 366
  } else {
    expectedDays <- 365
  }
  
  if (Sys.Date() < as.Date(paste0(year, "-12-31"))) {
    expectedDays <- as.integer(Sys.Date() - as.Date(paste0(year, "-01-01")))
  }
  
  apiNAs <- apiData %>% 
    dplyr::select(
      "precip_total_mm",
      "relative_humidity_max",
      "relative_humidity_mean",
      "relative_humidity_min",
      "sol_rad_total",
      "temp_air_maxC",
      "temp_air_meanC",
      "temp_air_minC",
      "temp_soil_10cm_maxC",
      "temp_soil_10cm_meanC",
      "temp_soil_10cm_minC",
      "temp_soil_50cm_maxC",
      "temp_soil_50cm_meanC",
      "temp_soil_50cm_minC",
      "vp_actual_mean",
      "vp_deficit_mean",
      "wind_spd_max_mps",
      "wind_spd_mean_mps",
      "wind_vector_dir",
      "wind_vector_dir_stand_dev",
      "wind_vector_magnitude"
    ) %>% 
    dplyr::summarise(total = sum(is.na(.)))
  
  legacyNAs <- legacyData %>% 
    dplyr::select(
      "obs_dyly_precip_total",
      "obs_dyly_relative_humidity_max",
      "obs_dyly_relative_humidity_mean",
      "obs_dyly_relative_humidity_min",
      "obs_dyly_sol_rad_total",
      "obs_dyly_temp_air_max",
      "obs_dyly_temp_air_mean",
      "obs_dyly_temp_air_min",
      "obs_dyly_temp_soil_10cm_max",
      "obs_dyly_temp_soil_10cm_mean",
      "obs_dyly_temp_soil_10cm_min",
      "obs_dyly_temp_soil_50cm_max",
      "obs_dyly_temp_soil_50cm_mean",
      "obs_dyly_temp_soil_50cm_min",
      "obs_dyly_actual_vp_mean",
      "obs_dyly_vpd_mean",
      "obs_dyly_wind_spd_max",
      "obs_dyly_wind_spd_mean",
      "obs_dyly_wind_vector_dir",
      "obs_dyly_wind_vector_dir_stand_dev",
      "obs_dyly_wind_vector_magnitude"
    ) %>% 
    dplyr::summarise(total = sum(is.na(.)))
  
  
  # Outputs -----
  
  reporting <- 
    htmltools::p(
      htmltools::HTML(
        paste0(
          "<u>NUMBER OF DAYS REPORTING</u><br>",
          "Legacy: <strong>", length(unique(legacyData$obs_doy)), "</strong> of <strong>", expectedDays, "</strong> days expected<br>",
          "API: <strong>", length(unique(apiData$date_doy)), "</strong> of <strong>", expectedDays, "</strong> days expected<br>",
          "<br>",
          "<u>NUMBER OF MISSING VALUES</u><sup>1,2</sup><br>",
          "Legacy: <strong>", legacyNAs$total, "</strong> values<br>",
          "API: <strong>", apiNAs$total, "</strong> values<br>",
          "<br>"
        )
      ),
      
      class = "reporting"
    )
  
  return(reporting)
}
