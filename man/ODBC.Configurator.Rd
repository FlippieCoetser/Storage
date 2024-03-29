% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ODBC.Configurator.R
\name{ODBC.Configurator}
\alias{ODBC.Configurator}
\title{Configure Data Store}
\value{
A \code{list} of functions:
\itemize{
\item \code{Open.Config.File()}
\item \code{Get.Config()}
}
}
\description{
Different data store providers: ODBC, SQL, File System, requires different configuration parameters.
\code{ODBC.Configurator()} helps retrieve and validate ODBC specific configuration sets.

\code{ODBC.Configurator()} returns a set of functions that can be used to define and retrieve configuration sets required by ODBC Data Sources:
\itemize{
\item The first function: \code{Open.Config.File}, will open an existing or a new empty \code{.Renviron} configuration file in your IDE.
User can then review or add environment variables for either a Preset Configuration: OS defined DSN or Manual Configuration.
\item The second function: \code{Get.Config}, will return a Preset Configuration by default or if type = 'Manual' is passed a Manual Configuration.
Independent of the type of configuration retrieved, extensive validation will be performed to ensure all required parameters are available.
If any parameter is missing, an error message will be thrown with useful information to allows the user to fix the problem.
}
}
