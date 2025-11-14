#' `fxn_legacyData.R` - Download and transform legacy data
#' 
#' @param station - AZMet station selection by user
#' @param year - Year selection by user
#' @return `legacyData` - Downloaded and transformed legacy data


fxn_legacyData <- function(station, year) {
  
  stationInfo <- station_list %>% 
    dplyr::filter(stn == station)
  
  legacyData <- azmet_daily_data_download( # from `uace-azmet/legacy-data-migration`
    station_list,
    station,
    years = year
  )
  
  legacyData <- legacyData$obs_dyly %>% 
    dplyr::select(
      "station_id",
      "station_number",
      "obs_datetime",
      "obs_doy",
      "obs_year",
      "obs_version",
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
    dplyr::mutate(
      obs_dyly_precip_total = as.numeric(obs_dyly_precip_total),
      obs_dyly_relative_humidity = as.numeric(obs_dyly_relative_humidity),
      obs_dyly_sol_rad_total = as.numeric(obs_dyly_sol_rad_total),
      obs_dyly_temp_air = as.numeric(obs_dyly_temp_air),
      obs_dyly_temp_soil_10cm = as.numeric(obs_dyly_temp_soil_10cm),
      obs_dyly_temp_soil_50cm = as.numeric(obs_dyly_temp_soil_50cm),
      obs_dyly_actual_vp_mean = as.numeric(obs_dyly_actual_vp_mean),
      obs_dyly_vpd_mean = as.numeric(obs_dyly_vpd_mean),
      obs_dyly_wind_spd = as.numeric(obs_dyly_wind_spd),
      obs_dyly_wind_spd_max = as.numeric(obs_dyly_wind_spd_max),
      obs_dyly_wind_vector_dir = as.numeric(obs_dyly_wind_vector_dir),
      obs_dyly_wind_vector_dir_stand_dev = as.numeric(obs_dyly_wind_vector_dir_stand_dev),
      obs_dyly_wind_vector_magnitude = as.numeric(obs_dyly_wind_vector_magnitude),
      date_datetime = obs_datetime
    )
  
  return(legacyData)
}
