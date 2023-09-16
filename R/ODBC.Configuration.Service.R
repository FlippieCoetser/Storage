ODBC.Configuration.Service <- \(broker) {
  services <- list()
  services[['OpenConfigFile']]  <- \() {
    broker[['OpenConfigFile']]()
  }
  services[['GetPresetConfig']] <- \() {}
  services[['GetManualConfig']] <- \() {}
  return(services)
}