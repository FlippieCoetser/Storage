ODBC.Configuration.Service <- \(broker) {
  validate <- ODBC.Configuration.Validator()

  services <- list()
  services[['OpenConfigFile']]  <- \() {
    broker[['OpenConfigFile']]()
  }
  services[['GetPresetConfig']] <- \() {
    broker[['GetPresetConfig']]() |>
    validate[['PresetConfig']]()
  }
  services[['GetManualConfig']] <- \() {
    broker[['GetManualConfig']]() |>
    validate[['ManualConfig']]()
  }
  return(services)
}