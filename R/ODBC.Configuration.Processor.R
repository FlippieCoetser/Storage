ODBC.Configuration.Processor <- \(service) {
  processes <- list()
  # TODO: Refactor -> Open.Config.File
  processes[['OpenConfigFile']] <- \() {
    service[['OpenConfigFile']]()
  }
  # TODO: Refactor -> Get.Config
  processes[['GetConfig']] <- \(type = 'Preset') {
    configuration <- list()
    configuration[['Preset']] <- \() service[['GetPresetConfig']]()
    configuration[['Manual']] <- \() service[['GetManualConfig']]()
    configuration[[type]]()
  }
  return(processes)
}