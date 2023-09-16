ODBC.Configuration.Service <- \() {
  services <- list()
  services[['OpenConfigFile']] <- \() {}
  services[['GetPresetConfig']] <- \() {}
  return(services)
}