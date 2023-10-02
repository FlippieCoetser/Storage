#' Configure Data Store
#'
#' @description
#' Different data store providers: ODBC, SQL, File System, requires different configuration parameters.
#' `ODBC.Configurator()` helps retrieve and validate ODBC specific configuration sets.
#'  
#' `ODBC.Configurator()` returns a set of functions that can be used to define and retrieve configuration sets required by ODBC Data Sources:
#' * The first function: `Open.Config.File`, will open an existing or a new empty `.Renviron` configuration file in your IDE. 
#' User can then review or add environment variables for either a Preset Configuration: OS defined DSN or Manual Configuration.
#' * The second function: `Get.Config`, will return a Preset Configuration by default or if type = 'Manual' is passed a Manual Configuration.
#' Independent of the type of configuration retrieved, extensive validation will be performed to ensure all required parameters are available.
#' If any parameter is missing, an error message will be thrown with useful information to allows the user to fix the problem.
#' @usage NULL
#' @returns A `list` of functions: 
#' * `Open.Config.File()`
#' * `Get.Config()`
#' @export
ODBC.Configurator <- \() {
  ODBC.Configuration.Broker() |>
  ODBC.Configuration.Service() |>
  ODBC.Configuration.Processor()
}