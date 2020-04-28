#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <-   function(input, output, session) {
  
  #---- upload data
  tisefka_inu <- callModule(module = SaldaeModulesUI::ghred_tisefka_mod, id = "tisefka_tizegzawin")
  
  #---- one plot multiple graphs
  output$plot_inu <- callModule(module =  SaldaeModulesUI::SA_tisefka_mod, id = "SA_module_tisefka",tisefka = reactive({tisefka_inu()}))
  
  #----- multiple plot multiple graphs
  callModule(module =  SaldaeModulesUI::SA_tisefka_multiple_mod, id = "SA_multiple_test", tisefka = reactive({tisefka_inu()}))
  
  #------- CandleStick View
  callModule(module =  SaldaeModulesUI::Saldae_taftilt_mod, id = "SA_taftilt_test", tisefka = reactive({tisefka_inu()}))
  
  callModule(module =  SaldaeModulesUI::Saldae_kefrida_mod, id = "SA_kefrida_test", tisefka = reactive({tisefka_inu()}))
  
  # #------ Data Clustering
  # callModule(module =  SA_clustering_mod, id = "SA_clustering_test", tisefka = reactive({tisefka_inu()}))
  # 
  #----- Value Box
  callModule(module = SaldaeModulesUI::SA_Value_box_server, id = "SA_valuebox", tisefka = tisefka_vb)
  
  #----- multiple plot multiple graphs: aggregation and anomaly detection
  callModule(module =  SaldaeModulesUI::SA_tisefka_aggregator_mod, id = "SA_time_aggregator", tisefka = reactive({tisefka_inu()}))
  
  #----- multiple plot multiple graphs: growth rates
  callModule(module =  SaldaeModulesUI::SA_tisefka_gemmu_mod, id = "SA_tisfka_gemmu", tisefka = reactive({tisefka_inu()}))
  
  
  #------ Forecasting tool
  tisefka_aggregated <- callModule(module =  SaldaeModulesUI::SA_tisefka_forecast_mod, id = "SA_tisfka_forecast", tisefka = reactive({tisefka_inu()}))
  
  
  #------ Reporting Pool
  callModule(module = SaldaeModulesUI::SA_reporting_mod, id = "Saldae_reporting",tisefka_list = reactive({tisefka_aggregated()}))
  
  ###########################################
  #########                           #######
  ###             TAGARA                  ###
  ########                            #######
  ###########################################
  #--- mdel shiny
  session$onSessionEnded(function() {
    stopApp()
  })
  #----- tagara
  
}