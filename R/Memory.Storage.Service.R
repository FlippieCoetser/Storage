Memory.Storage.Service <- \() {
  services <- list()
  services[['ExecuteQuery']] <- \() {}
  services[['Insert']]       <- \() {}
  return(services)
}