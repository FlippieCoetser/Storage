ODBC.Storage.Service <- \(configuration) {
  storage.validate <- ODBC.Storage.Validation.Service()
  configuration |>  storage.validate[["Configuration"]]()

  storage.exception  <- ODBC.Storage.Exceptions()
  model.validate     <- Model.Validation.Service()

  service <- list()
  service[["CreateConnection"]] <- \() {
    tryCatch(
      DBI::dbConnect(
        odbc::odbc(),
        dsn = configuration[["DSN"]],
        uid = configuration[["Username"]],
        pwd = configuration[["Password"]]
      ),
      error=storage.exception[["ConnectionExceptions"]]
    )
  }
  service[["ExecuteQuery"]] <- \(query) {
    connection <- service[["CreateConnection"]]()

    tryCatch(
      response <-
        connection |>
          DBI::dbGetQuery(query),
      error=storage.exception[["QueryExceptions"]]
    )

    connection |>
      DBI::dbDisconnect()

    return(response)
  }

  service[["Todo"]] <- list()
  service[["Todo"]][["Insert"]]        <- \(todo) {
    todo |> model.validate[["Todo"]]()
    stringr::str_glue(
      "INSERT INTO [dbo].[Todo] ",
      "(Id, Task, Status) ",
      "VALUES ('{todo[['Id']]}', '{todo[['Task']]}', '{todo[['Status']]}')") |>
        service[["ExecuteQuery"]]()
  }
  service[["Todo"]][["Select"]]        <- \()     {
    stringr::str_glue(
      "SELECT LOWER([Id]) as Id ,[Task],[Status] ",
      "FROM [dbo].[Todo]") |>
      service[["ExecuteQuery"]]()
  }
  service[["Todo"]][["SelectWhereId"]] <- \(id)   {
    id |> model.validate[["Id"]]()
    stringr::str_glue(
      "SELECT LOWER([Id]) as Id ,[Task],[Status] ",
      "FROM [dbo].[Todo]",
      "WHERE Id = '{id}'") |>
      service[["ExecuteQuery"]]()
  }
  service[["Todo"]][["Update"]]        <- \(todo) {
    todo |> model.validate[["Todo"]]()
    stringr::str_glue(
      "UPDATE [dbo].[ToDo] ",
      "SET Task = '{todo[['Task']]}', Status = '{todo[['Status']]}' ",
      "WHERE Id = '{todo[['Id']]}'") |>
      service[["ExecuteQuery"]]()
  }
  service[["Todo"]][["Delete"]]        <- \(id)   {
    id |> model.validate[["Id"]]()
    stringr::str_glue(
      "DELETE ",
      "FROM [dbo].[ToDo] ",
      "WHERE Id = '{id}'") |>
      service[["ExecuteQuery"]]()
  }
  return(service)
}
