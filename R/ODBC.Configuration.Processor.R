ODBC.Configuration.Processor <- \(service) {
  processes <- list()
  processes[['Open.Config.File']] <- \() {
    service[['Open.Config.File']]()
  }
  processes[['Get.Config']]       <- \(type = 'Preset') {
    configuration <- list()
    configuration[['Preset']] <- \() service[['Get.Preset.Config']]()
    configuration[['Manual']] <- \() service[['Get.Manual.Config']]()
    configuration[[type]]()
  }
  return(processes)
}