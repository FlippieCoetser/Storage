Memory.Storage.Validator <- \() {
  validators <- list()
  validators[['NoImplementation']] <- \() {}
  return(validators)
}