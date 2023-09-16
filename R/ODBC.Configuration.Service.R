ODBC.Configuration.Service <- \() {
  services <- list()
  services[['OpenConfigFile']] <- \() {}
  services[['GetPresetConfig']] <- \() {}
  services[['GetManualConfig']] <- \() {}
  return(services)
}