ODBC.Configuration.Processor <- \() {
  processes <- list()
  processes[['OpenConfigFile']] <- \() {}
  processes[['GetConfiguration']] <- \() {}
  return(processes)
}