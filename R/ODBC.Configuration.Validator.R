ODBC.Configuration.Validator <- \() {
  exception <- ODBC.Configuration.Validation.Exceptions()

  validations <- list()
  validations[['Configuration']]     <- \(configuration) {
    valid.preset.config <- TRUE
    valid.manual.config <- TRUE

    configuration |> validations[['preset.config']]() |> 
      tryCatch(error = \(...) { valid.preset.config <<- FALSE })

    configuration |> validations[['manual.config']]() |>
      tryCatch(error = \(...) { valid.manual.config <<- FALSE })

    valid.config <- valid.preset.config || valid.manual.config
    if (!valid.config) {
      TRUE |> exception[['config.invalid']]()
    }
    return(configuration)
  }
  validations[['preset.config']]     <- \(configuration) {
    configuration |>
      validations[['has.drv']]() |>
      validations[['has.dsn']]() |>
      validations[['has.uid']]() |>
      validations[['has.pwd']]()       
  }
  validations[['manual.config']] <- \(configuration) {
    configuration |>
      validations[['has.drv']]()      |>
      validations[['has.driver']]()   |>
      validations[['has.server']]()   |>
      validations[['has.database']]() |>
      validations[['has.uid']]()      |>
      validations[['has.pwd']]()       
  }
  validations[['has.drv']]           <- \(configuration) {
    configuration[['drv']] |> is.null() |> exception[['drv.NULL']]()
    return(configuration)
  }
  validations[['has.dsn']]           <- \(configuration) {
    configuration[['dsn']] |> is.null() |> exception[['dsn.NULL']]()
    return(configuration)
  }
  validations[['has.driver']]        <- \(configuration) {
    configuration[['driver']] |> is.null() |> exception[['driver.NULL']]()
    return(configuration)
  }
  validations[['has.server']]        <- \(configuration) {
    configuration[['server']] |> is.null() |> exception[['server.NULL']]()
    return(configuration)
  }
  validations[['has.database']]      <- \(configuration) {
    configuration[['database']] |> is.null() |> exception[['database.NULL']]()
    return(configuration)
  }
  validations[['has.uid']]           <- \(configuration) {
    configuration[['uid']] |> is.null() |> exception[['uid.NULL']]()
    return(configuration)
  }
  validations[['has.pwd']]           <- \(configuration) {
    configuration[['pwd']] |> is.null() |> exception[['pwd.NULL']]()
    return(configuration)
  }
  return(validations)
}