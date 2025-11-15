#' `fxn_apiData.R` - Download and transform api data
#' 
#' @param station - AZMet station selection by user
#' @param year - Year selection by user
#' @return `apiData` - Downloaded and transformed api data


fxn_apiData <- function(station, year) {
  
  stationInfo <- station_list %>% 
    dplyr::filter(stn == station)
  
  if (nchar(stationInfo$stn_no) == 1) {
    station_id <- paste0("az0", stationInfo$stn_no)
  } else { # nchar (stationInfo$stn_no) > 1
    station_id <- paste0("az", stationInfo$stn_no)
  }
  
  apiData <- azmetr::az_daily(
    station_id = station_id,
    start_date = paste(year, "-01-01"),
    end_date = paste(year, "-12-31")
  ) %>% 
    dplyr::select(
      "datetime", 
      "date_doy",
      "date_year", 
      "meta_needs_review", 
      "meta_station_id", 
      "meta_station_name", 
      "meta_version",
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
    dplyr::mutate(datetime = as.character(datetime))
  
  return(apiData)
}
