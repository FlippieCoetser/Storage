ODBC.Configuration.Validator <- \() {
  exception <- ODBC.Configuration.Exceptions()

  validations <- list()
  validations[['Configuration']]     <- \(configuration) {
    valid.preset.config <- TRUE
    valid.manual.config <- TRUE

    configuration |> validations[['Preset.Config']]() |> 
      tryCatch(error = \(...) { valid.preset.config <<- FALSE })

    configuration |> validations[['Get.Manual.Config']]() |>
      tryCatch(error = \(...) { valid.manual.config <<- FALSE })

    valid.config <- valid.preset.config || valid.manual.config
    if (!valid.config) {
      TRUE |> exception[['Config.Invalid']]()
    }
    return(configuration)
  }
  validations[['Preset.Config']]     <- \(configuration) {
    configuration |>
      validations[['Has.Drv']]() |>
      validations[['Has.Dsn']]() |>
      validations[['Has.Uid']]() |>
      validations[['Has.Pwd']]()       
  }
  validations[['Get.Manual.Config']] <- \(configuration) {
    configuration |>
      validations[['Has.Drv']]()      |>
      validations[['Has.Driver']]()   |>
      validations[['Has.Server']]()   |>
      validations[['Has.Database']]() |>
      validations[['Has.Uid']]()      |>
      validations[['Has.Pwd']]()       
  }
  validations[['Has.Drv']]           <- \(configuration) {
    configuration[['drv']] |> is.null() |> exception[['Drv.NULL']]()
    return(configuration)
  }
  validations[['Has.Dsn']]           <- \(configuration) {
    configuration[['dsn']] |> is.null() |> exception[['Dsn.NULL']]()
    return(configuration)
  }
  validations[['Has.Driver']]        <- \(configuration) {
    configuration[['driver']] |> is.null() |> exception[['Driver.NULL']]()
    return(configuration)
  }
  validations[['Has.Server']]        <- \(configuration) {
    configuration[['server']] |> is.null() |> exception[['Server.NULL']]()
    return(configuration)
  }
  validations[['Has.Database']]      <- \(configuration) {
    configuration[['database']] |> is.null() |> exception[['Database.NULL']]()
    return(configuration)
  }
  validations[['Has.Uid']]           <- \(configuration) {
    configuration[['uid']] |> is.null() |> exception[['Uid.NULL']]()
    return(configuration)
  }
  validations[['Has.Pwd']]           <- \(configuration) {
    configuration[['pwd']] |> is.null() |> exception[['Pwd.NULL']]()
    return(configuration)
  }
  return(validations)
}