ODBC.Configuration.Service <- \(broker) {
  validate <- ODBC.Configuration.Validator()

  services <- list()
  services[['open.config.file']]  <- \() {
    broker[['open.config.file']]()
  }
  services[['get.preset.config']] <- \() {
    broker[['get.preset.config']]() |>
    validate[['preset.config']]()
  }
  services[['get.manual.config']] <- \() {
    broker[['get.manual.config']]() |>
    validate[['manual.config']]()
  }
  return(services)
}