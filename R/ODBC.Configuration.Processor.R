ODBC.Configuration.Processor <- \(service) {
  processes <- list()
  processes[['OpenConfigFile']] <- \() {
    service[['OpenConfigFile']]()
  }
  processes[['GetConfig']] <- \(type) {
    configuration <- list()
    configuration[['Preset']] <- \() service[['GetPresetConfig']]()
    configuration[['Manual']] <- \() service[['GetManualConfig']]()
    configuration[[type]]()
  }
  return(processes)
}