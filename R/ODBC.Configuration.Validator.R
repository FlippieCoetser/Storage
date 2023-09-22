ODBC.Configuration.Validator <- \() {
  exception <- ODBC.Configuration.Exceptions()

  validations <- list()
  validations[['Configuration']] <- \(configuration) {
    valid.preset.config <- TRUE
    valid.manual.config <- TRUE

    tryCatch(
      configuration |> validations[['PresetConfig']](),
      error = \(...) {
        valid.preset.config <<- FALSE
      }
    )
    tryCatch(
      configuration |> validations[['ManualConfig']](),
      error = \(...) {
        valid.manual.config <<- FALSE
      }
    )

    valid.config <- valid.preset.config || valid.manual.config
    if (!valid.config) {
      TRUE |> exception[['InvalidConfig']]()
    }
  }
  validations[['PresetConfig']] <- \(configuration) {
    configuration |>
      validations[['HasDrv']]() |>
      validations[['HasDsn']]() |>
      validations[['HasUid']]() |>
      validations[['HasPwd']]()       
  }
  validations[['ManualConfig']] <- \(configuration) {
    configuration |>
      validations[['HasDrv']]()      |>
      validations[['HasDriver']]()   |>
      validations[['HasServer']]()   |>
      validations[['HasDatabase']]() |>
      validations[['HasUid']]()      |>
      validations[['HasPwd']]()       
  }
  validations[['HasDrv']]       <- \(configuration) {
    configuration[['drv']] |> is.null() |> exception[['drvIsNull']]()
    return(configuration)
  }
  validations[['HasDsn']]       <- \(configuration) {
    configuration[['dsn']] |> is.null() |> exception[['dsnIsNull']]()
    return(configuration)
  }
  validations[['HasDriver']]    <- \(configuration) {
    configuration[['driver']] |> is.null() |> exception[['driverIsNull']]()
    return(configuration)
  }
  validations[['HasServer']]    <- \(configuration) {
    configuration[['server']] |> is.null() |> exception[['serverIsNull']]()
    return(configuration)
  }
  validations[['HasDatabase']]  <- \(configuration) {
    configuration[['database']] |> is.null() |> exception[['databaseIsNull']]()
    return(configuration)
  }
  validations[['HasUid']]       <- \(configuration) {
    configuration[['uid']] |> is.null() |> exception[['uidIsNull']]()
    return(configuration)
  }
  validations[['HasPwd']]       <- \(configuration) {
    configuration[['pwd']] |> is.null() |> exception[['pwdIsNull']]()
    return(configuration)
  }
  return(validations)
}