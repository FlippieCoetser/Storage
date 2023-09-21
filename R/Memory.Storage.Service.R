Memory.Storage.Service <- \() {
  services <- list()
  services[['ExecuteQuery']]  <- \() {}
  services[['Insert']]        <- \() {}
  services[['Select']]        <- \() {}
  services[['SelectWhereId']] <- \() {}
  return(services)
}