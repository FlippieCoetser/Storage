ODBC.Configuration.Service <- \(broker) {
  validate <- ODBC.Configuration.Validator()

  services <- list()
  services[['Open.Config.File']]  <- \() {
    broker[['Open.Config.File']]()
  }
  services[['Get.Preset.Config']] <- \() {
    broker[['Get.Preset.Config']]() |>
    validate[['Preset.Config']]()
  }
  services[['Get.Manual.Config']] <- \() {
    broker[['Get.Manual.Config']]() |>
    validate[['Get.Manual.Config']]()
  }
  return(services)
}