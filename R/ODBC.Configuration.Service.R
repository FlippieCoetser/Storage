ODBC.Configuration.Service <- \(broker) {
  validate <- ODBC.Configuration.Validator()

  services <- list()
  # TODO: Refactor -> Open.Config.File
  services[['OpenConfigFile']]  <- \() {
    broker[['OpenConfigFile']]()
  }
  # TODO: Refactor -> Get.Preset.Config
  services[['GetPresetConfig']] <- \() {
    broker[['GetPresetConfig']]() |>
    validate[['PresetConfig']]()
  }
  # TODO: Refactor -> Get.Manual.Config
  services[['GetManualConfig']] <- \() {
    broker[['GetManualConfig']]() |>
    validate[['ManualConfig']]()
  }
  return(services)
}