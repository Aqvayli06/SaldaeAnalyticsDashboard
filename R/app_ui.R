#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd

require("shiny")
require("dplyr")
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = "Saldae Analytics Platform"),
      shinydashboard::dashboardSidebar(disable = FALSE,
                                       shinydashboard::sidebarMenu(
                                         shinydashboard::menuItem("Data View", tabName = "data_upload", icon = icon("table")),
                                         shinydashboard::menuItem("Exploration", icon = icon("chart-pie"), tabName = "data_exploration"),
                                         shinydashboard::menuItem("Preparation", icon = icon("check-circle"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Insights", tabName = "data_insights"),
                                                                  shinydashboard::menuSubItem("Cleaning", tabName = "data_aggregation")
                                         ),
                                         shinydashboard::menuItem("Advanced", icon = icon("briefcase"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Growth Rate", tabName = "growth_rate"),
                                                                  shinydashboard::menuSubItem("Business", tabName = "business_charts")
                                         ),
                                         shinydashboard::menuItem("Advanced Analytics", icon = icon("chart-line"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Causality", tabName = "causal_impact"),
                                                                  shinydashboard::menuSubItem("Predictions", tabName = "advanced_analytics"),
                                                                  shinydashboard::menuSubItem("Scenario Simulation", tabName = "simulation_engine")
                                         ),
                                         shinydashboard::menuItem("Reporting Pool", icon = icon("file-signature"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Settings", tabName = "reporting_settings"),
                                                                  shinydashboard::menuSubItem("Generate and publish", tabName = "reporting_generation")
                                         )
                                         
                                         
                                         
                                         #- tagara sidebarMenu
                                       )
                                       #- tagara dashboardSidebar
                                       ),
      shinydashboard::dashboardBody(
        
        
        shinydashboard::tabItems(
          shinydashboard::tabItem("data_upload",
                                  tisefka_inu <- SaldaeModulesUI::ghred_tisefka_UI(id = "tisefka_tizegzawin")
                                  
          ),
          shinydashboard::tabItem("data_exploration", 
                                  SaldaeModulesUI::SA_Value_box_UI("SA_valuebox"),
                                  
                                  SaldaeModulesUI::SA_tisefka_UI("SA_module_tisefka",mod_title= "Saldae Module")
                                  
                                  ),
          
          shinydashboard::tabItem("data_insights", 
                                  SaldaeModulesUI::SA_tisefka_multiple_UI("SA_multiple_test",mod_title= "Saldae Module")
                                  ),
          shinydashboard::tabItem("business_charts",
                                  fluidRow(
                                    col_6(SaldaeModulesUI::Saldae_taftilt_UI("SA_taftilt_test",mod_title= "Saldae CandleStick Module")),
                                    col_6(SaldaeModulesUI::Saldae_amadal_UI("SA_amadal_test",mod_title= "Saldae Map Module"))
                                  ),
                                  SaldaeModulesUI::Saldae_kefrida_UI("SA_kefrida_test",mod_title= "Saldae Waterfall Module")
                                  
                                  
          ),
          
          shinydashboard::tabItem("data_aggregation",
                                  SaldaeModulesUI::SA_tisefka_aggregator_UI("SA_time_aggregator")
                                  ),
          shinydashboard::tabItem("growth_rate",
                                  SaldaeModulesUI::SA_tisefka_gemmu_UI("SA_tisfka_gemmu")
          ),
          # shinydashboard::tabItem("causal_impact",
          #                         SA_clustering_ui("SA_clustering_test")
          # ),
          shinydashboard::tabItem("advanced_analytics",
                                  SaldaeModulesUI::SA_tisefka_forecast_UI("SA_tisfka_forecast")
          )
          
          ,
          #------------ reporting pool
          
          shinydashboard::tabItem("reporting_settings",
                                  SaldaeModulesUI::SA_reporting_UI("Saldae_reporting")
          )
          
        #- tagara menu item
        )
        
        

      )
    )
  )
}
#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'SaldaeAnalyticsDashboard'
    )
  )
}
