ODBC.Configuration.Service <- \(broker) {
  services <- list()
  services[['OpenConfigFile']]  <- \() {
    broker[['OpenConfigFile']]()
  }
  services[['GetPresetConfig']] <- \() {
    broker[['GetPresetConfig']]()
  }
  services[['GetManualConfig']] <- \() {}
  return(services)
}