sidebarScatterplot <- bslib::sidebar(
  width = 300,
  position = "left",
  open = list(desktop = "open", mobile = "always-above"),
  id = "sidebarScatterplot",
  title = NULL,
  bg = "#FFFFFF",
  fg = "#191919",
  class = NULL,
  max_height_mobile = NULL,
  gap = NULL,
  padding = NULL,
  
  bslib::accordion(
    id = "accordionScatterplot",
    #open = "DATE SELECTION",
    #multiple = TRUE,
    class = NULL,
    width = "auto",
    height = "auto",

    # Visible elements

    htmltools::p(
      bsicons::bs_icon("sliders"),
      htmltools::HTML("&nbsp;"),
      "DATA DISPLAY",
      htmltools::HTML("&nbsp;&nbsp;&nbsp;&nbsp;"),
      bslib::tooltip(
        bsicons::bs_icon("info-circle"),
        "Select Legacy and API variables to display in the graph.",
        id = "infoDataOptions",
        placement = "right"
      ),

      class = "data-display-title"
    ),

    shiny::selectInput(
      inputId = "legacyVars",
      label = "Legacy Variable",
      choices = c(
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
      )
    ),

    shiny::selectInput(
      inputId = "apiVars",
      label = "API Variable",
      choices = c(
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
      )
    )
  )
) # bslib::sidebar()
