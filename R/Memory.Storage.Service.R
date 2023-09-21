Memory.Storage.Service <- \() {
  services <- list()
  services[['ExecuteQuery']]  <- \() {}
  services[['Insert']]        <- \() {}
  services[['Select']]        <- \() {}
  services[['SelectWhereId']] <- \() {}
  services[['Update']]        <- \() {}
  return(services)
}