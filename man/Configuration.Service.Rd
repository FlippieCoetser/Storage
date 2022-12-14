% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Configuration.Service.R
\name{Configuration.Service}
\alias{Configuration.Service}
\title{Configure Data Store}
\value{
A \code{list} of functions:
\itemize{
\item \code{OpenConfigurationFile()}
\item \code{GetOBDCConfiguration(name)}
}
}
\description{
Different data store providers: ODBC, SQL, File System, requires different configuration parameters.
\code{Configuration.Service()} helps retrieve and validate data store specific configuration sets.

\code{Configuraiton.Service()} returns a set of functions that can be used to define and retrieve configuration sets:
\itemize{
\item The first function: \code{OpenConfigurationFile}, will open an existing or a new empty \code{.Renviron} configuration file.
If missing, users can then add environment variables required by a specific data store provider.
\item The second function: \code{GetODBCConfiguration}, will return a data store configuration: list of environment variables.
The list of environment variables are validated and to enable communication with an ODBC Data source.
If a required parameter was not found in the local \code{.Renviron} file validation will fail and an exception will be thrown.
Most common exceptions is due to missing environment variables, which can be resolved using the function above.
}
}
\examples{
configurator <- Configuration.Service()

configuration <- configurator[["GetODBCConfiguration"]]()

rm(configurator)
}
