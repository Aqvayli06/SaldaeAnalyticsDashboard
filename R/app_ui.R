#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd

require("shiny")
require("dplyr")
require("prophet")
app_ui <- function(request) {
  tagList(
    shinyalert::useShinyalert(),
    golem_add_external_resources(),
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = span("SALDAE ANALYTCIS", 
                                                       style = "color: black; font-weight: bold ;font-size: 16px")),
      shinydashboard::dashboardSidebar(disable = FALSE,
                                       shinydashboard::sidebarMenu(
                                         shinydashboard::menuItem("Data View", tabName = "data_upload", icon = icon("table")),
                                         
                                         shinydashboard::menuItem("Explore & Prepare", icon = icon("check-circle"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Exploration", icon = icon("chart-pie"), tabName = "data_exploration"),
                                                                  shinydashboard::menuSubItem("Insights", icon = icon("lightbulb"), tabName = "data_insights"),
                                                                  shinydashboard::menuSubItem("Aggregation", icon = icon("react"), tabName = "data_aggregation"),
                                                                  shinydashboard::menuSubItem("Growth Rate", icon = icon("percent"), tabName = "growth_rate")
                                         ),
                                         shinydashboard::menuItem(" Anomaly Pool", icon = icon("searchengin"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Anomaly Suit",tabName = "anomaly_pool")
                                         ),
                                         
                                         shinydashboard::menuItem("AI & Analytics", icon = icon("chart-line"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Causality", tabName = "causal_impact"),
                                                                  shinydashboard::menuSubItem("Forecasting", icon = icon("chart-bar"), tabName = "advanced_analytics")
                                                                  # shinydashboard::menuSubItem("Scenario Simulation", tabName = "simulation_engine")
                                         ),
                                         shinydashboard::menuItem("Reporting/Dashboard", icon = icon("file-signature"), startExpanded = FALSE,
                                                                  shinydashboard::menuSubItem("Generate and publish", tabName = "saldae_report")
                                         ),
                                         
                                         shinydashboard::menuItem("Focus", icon = icon("briefcase"), startExpanded = FALSE,
                                                                  
                                                                  shinydashboard::menuSubItem("Business", tabName = "business_charts")
                                         ),
                                         shinydashboard::menuItem("Data Provider", icon = icon("globe-africa"), tabName = "SA_data_provider")
                                         
                                         
                                         
                                         #- tagara sidebarMenu
                                       )
                                       #- tagara dashboardSidebar
                                       ),
      shinydashboard::dashboardBody(
        
        
        shinydashboard::tabItems(
          shinydashboard::tabItem("data_upload",
                                  tisefka_inu <- SaldaeModulesUI::ghred_tisefka_UI(id = "tisefka_tizegzawin"),
                                  
                                  
                                  
          ),
          shinydashboard::tabItem("data_exploration", 
                                  SaldaeModulesUI::SA_Value_box_UI("SA_valuebox"),
                                  SaldaeModulesUI::SA_key_figures_UI("SA_key_figures"),
                                  
                                  SaldaeModulesUI::SA_tisefka_UI("SA_module_tisefka",mod_title= "Saldae Module")
                                  
                                  ),
          
          shinydashboard::tabItem("data_insights", 
                                  SaldaeModulesUI::SA_tisefka_multiple_UI("SA_multiple_test",mod_title= "Saldae Module")
                                  ),
          shinydashboard::tabItem("anomaly_pool", 
                                  SaldaeModulesUI::SA_anomaly_UI("SA_anomaly_pool",mod_title= "Saldae Module")
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
          
          
          # ------------ Advanced Analytics
          ## Causal Impact and Clustering
          shinydashboard::tabItem("causal_impact",
                                  SaldaeForecasting::SA_clustering_core_ui("SA_clustering_core_test"),
                                  fluidRow(
                                    column(4, d3scatter::d3scatterOutput("clust_mds")),
                                    column(8, plotOutput("by_clusters"))
                                  )),

          ## Prediction
          shinydashboard::tabItem("advanced_analytics",
                                  SaldaeModulesUI::SA_tisefka_forecast_UI("SA_tisfka_forecast")
          ),
          #------------ reporting pool
          
          shinydashboard::tabItem("saldae_report",
                                  SaldaeModulesUI::SA_reporting_UI("Saldae_reporting")
          )
          ## Saldae Data

          # shinydashboard::tabItem("SA_data_provider",
          #                         SA_EuroStat_UI("SA_eurostat_test")
          # )
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
