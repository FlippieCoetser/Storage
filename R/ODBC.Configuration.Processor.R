ODBC.Configuration.Processor <- \(service) {
  processes <- list()
  processes[['OpenConfigFile']] <- \() {
    service[['OpenConfigFile']]()
  }
  processes[['GetConfig']] <- \() {}
  return(processes)
}