Memory.Storage.Validator <- \() {
  exception <- Memory.Storage.Exceptions()

  validators <- list()
  validators[['NoImplementation']] <- \() {
    TRUE |> exception[['NoExecuteQuery']]()
  }
  validators[['IsNew']] <- \() {}
  return(validators)
}