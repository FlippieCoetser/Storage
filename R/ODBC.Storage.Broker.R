ODBC.Storage.Broker <- \(configuration){
  storage.validate <- ODBC.Storage.Validation.Service()
  configuration |>  storage.validate[["Configuration"]]()

  exception  <- ODBC.Storage.Exceptions()

  service <- list()
  service[["CreateConnection"]] <- \() {
    tryCatch(
      DBI::dbConnect(
        odbc::odbc(),
        dsn = configuration[["DSN"]],
        uid = configuration[["Username"]],
        pwd = configuration[["Password"]]
      ),
      error=exception[["ConnectionExceptions"]]
    )
  }
  service[["ExecuteQuery"]] <- \(query) {
    connection <- service[["CreateConnection"]]()

    output <- NULL
    output <- tryCatch(
        connection |> DBI::dbGetQuery(query),
        error = exception[["QueryExceptions"]]
    )

    connection |>
      DBI::dbDisconnect()

    return(output)
  }

  service[["Todo"]] <- list()

  service[["Todo"]][["Insert"]]        <- \(todo) {
    hasId <- todo[["Id"]] |> is.null() |> isFALSE()
    hasTask <- todo[["Task"]] |> is.null() |> isFALSE()
    hasStatus <- todo[["Status"]] |> is.null() |> isFALSE()

    if (hasId & hasTask & hasStatus) {
        stringr::str_glue(
            "INSERT INTO [dbo].[Todo] ",
            "(Id, Task, Status) ",
            "VALUES ('{todo[['Id']]}', '{todo[['Task']]}', '{todo[['Status']]}')") |>
            service[["ExecuteQuery"]]()
    }

    return(data.frame())
  }
  service[["Todo"]][["Select"]]        <- \()     {
    stringr::str_glue(
      "SELECT LOWER([Id]) as Id ,[Task],[Status] ",
      "FROM [dbo].[Todo]") |>
      service[["ExecuteQuery"]]()
  }
  service[["Todo"]][["SelectWhereId"]] <- \(id)   {
    idExist <- id |> is.null() |> isFALSE()

    todo <- NULL
    if (idExist) {
        todo <- stringr::str_glue(
            "SELECT LOWER([Id]) as Id ,[Task],[Status] ",
            "FROM [dbo].[Todo]",
            "WHERE Id = '{id}'") |>
                service[["ExecuteQuery"]]()
    }

    return(todo)
  }
  service[["Todo"]][["Update"]]        <- \(todo) {
      hasId <- todo[["Id"]] |> is.null() |> isFALSE()
      hasTask <- todo[["Task"]] |> is.null() |> isFALSE()
      hasStatus <- todo[["Status"]] |> is.null() |> isFALSE()

      if (hasId & hasTask & hasStatus) {
          stringr::str_glue(
            "UPDATE [dbo].[ToDo] ",
            "SET Task = '{todo[['Task']]}', Status = '{todo[['Status']]}' ",
            "WHERE Id = '{todo[['Id']]}'") |>
                service[["ExecuteQuery"]]()
      }

      return(data.frame())
  }
  service[["Todo"]][["Delete"]]        <- \(id)   {
      idExist <- id |> is.null() |> isFALSE()

    if (idExist) {
        stringr::str_glue(
            "DELETE ",
            "FROM [dbo].[ToDo] ",
            "WHERE Id = '{id}'") |>
            service[["ExecuteQuery"]]()
    }

    return(data.frame())
  }
  return(service)

}
