ODBC.Configuration.Processor <- \(service) {
  processes <- list()
  processes[['open.config.file']] <- \() {
    service[['open.config.file']]()
  }
  processes[['get.config']]       <- \(type = 'Preset') {
    configuration <- list()
    configuration[['Preset']] <- \() service[['get.preset.config']]()
    configuration[['Manual']] <- \() service[['get.manual.config']]()
    configuration[[type]]()
  }
  return(processes)
}