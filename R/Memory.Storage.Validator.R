Memory.Storage.Validator <- \() {
  exception <- Memory.Storage.Exceptions()

  validators <- list()
  validators[['NoImplementation']] <- \() {
    TRUE |> exception[['NoExecuteQuery']]()
  }
  return(validators)
}