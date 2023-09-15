Storage.Configuration.Exceptions <- \() {
  exception <- list()
  exception[['dsnIsNull']] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no dsn', call. = FALSE)
    }
  }
  exception[['uidIsNull']] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no uid', call. = FALSE)
    }
  }
  exception[['pwdIsNull']] <- \(invoke) {
    if (invoke) {
      stop('Configuration has no pwd', call. = FALSE)
    }
  }
  return(exception)
}