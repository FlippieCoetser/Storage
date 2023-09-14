Configuration.Exceptions <- \() {
  exception <- list()
  exception[["DSNIsNull"]] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no DSN', call. = FALSE)
    }
  }
  exception[["UIDIsNull"]] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no UID', call. = FALSE)
    }
  }
  exception[["PWDIsNull"]] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no PWD', call. = FALSE)
    }
  }
  return(exception)
}