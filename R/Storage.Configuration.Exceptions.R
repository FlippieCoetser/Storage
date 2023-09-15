Storage.Configuration.Exceptions <- \() {
  exception <- list()
  exception[["DSNIsNull"]] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no dsn', call. = FALSE)
    }
  }
  exception[["UIDIsNull"]] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no uid', call. = FALSE)
    }
  }
  exception[["PWDIsNull"]] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no pwd', call. = FALSE)
    }
  }
  return(exception)
}