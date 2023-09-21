Memory.Storage.Validation <- \() {
  validators <- list()
  validators[['NoImplementation']] <- \() {}
  return(validators)
}