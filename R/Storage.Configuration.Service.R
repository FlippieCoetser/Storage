#' Configure Data Store
#'
#' @description
#' Different data store providers: ODBC, SQL, File System, requires different configuration parameters.
#' `Storage.Configuration.Service()` helps retrieve and validate data store specific configuration sets.
#'  
#' `Storage.Configuration.Service()` returns a set of functions that can be used to define and retrieve configuration sets:
#' * The first function: `OpenConfigurationFile`, will open an existing or a new empty `.Renviron` configuration file.
#' If missing, users can then add environment variables required by a specific data store provider.
#' * The second function: `GetPresetConfig`, will return a data store configuration: list of environment variables.
#' The list of environment variables are validated and to enable communication with an ODBC Data source.
#' If a required parameter was not found in the local `.Renviron` file validation will fail and an exception will be thrown.
#' Most common exceptions is due to missing environment variables, which can be resolved using the function above. 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `OpenConfigurationFile()`
#' * `GetPresetConfig()`
#' @export
Storage.Configuration.Service <- \(broker) {
  validate <- Storage.Configuration.Validator()
    
  services <- list()
  services[['OpenConfigFile']]  <- \() {
    broker[['OpenConfigFile']]()
  }
  services[['GetPresetConfig']] <- \() {
    broker[['GetPresetConfig']]() |>
    validate[['PresetConfig']]()
  }
  services[['GetManualConfig']] <- \() { 
    broker[['GetManualConfig']]()
  }
  return(services)
}