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
    return(configuration)
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
  # TODO: Refactor -> Has.Drv
  validations[['HasDrv']]       <- \(configuration) {
    configuration[['drv']] |> is.null() |> exception[['drvIsNull']]()
    return(configuration)
  }
  # TODO: Refactor -> Has.Dsn
  validations[['HasDsn']]       <- \(configuration) {
    configuration[['dsn']] |> is.null() |> exception[['dsnIsNull']]()
    return(configuration)
  }
  # TODO: Refactor -> Has.Driver
  validations[['HasDriver']]    <- \(configuration) {
    configuration[['driver']] |> is.null() |> exception[['driverIsNull']]()
    return(configuration)
  }
  # TODO: Refactor -> Has.Server
  validations[['HasServer']]    <- \(configuration) {
    configuration[['server']] |> is.null() |> exception[['serverIsNull']]()
    return(configuration)
  }
  # TODO: Refactor -> Has.Database
  validations[['HasDatabase']]  <- \(configuration) {
    configuration[['database']] |> is.null() |> exception[['databaseIsNull']]()
    return(configuration)
  }
  # TODO: Refactor -> Has.Uid
  validations[['HasUid']]       <- \(configuration) {
    configuration[['uid']] |> is.null() |> exception[['uidIsNull']]()
    return(configuration)
  }
  # TODO: Refactor -> Has.Pwd
  validations[['HasPwd']]       <- \(configuration) {
    configuration[['pwd']] |> is.null() |> exception[['pwdIsNull']]()
    return(configuration)
  }
  return(validations)
}