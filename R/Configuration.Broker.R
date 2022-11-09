Configuration.Broker <- \() {
  service <- Environment::Utility.Service()

    broker <- list()
    broker[["GetODBCConfiguration"]]  <- \() {
      configuration <- list()
      
      configuration[["DSN"]]      <- "DSN"      |> service[["GetVariableByName"]]()
      configuration[["Username"]] <- "Username" |> service[["GetVariableByName"]]()
      configuration[["Password"]] <- "Password" |> service[["GetVariableByName"]]()

    return(configuration)
    }
    broker[["OpenConfigurationFile"]] <- \() {
      service[["OpenConfigurationFile"]]()
    }

  return(broker)
}