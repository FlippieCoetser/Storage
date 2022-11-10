#' ODBC Data Access Layer
#'
#' @description
#' Typical operations perform on a Data Stores, for example a SQL Database, includes `Insert`, `Select`, `Update` and `Delete`.
#' This `Storage` package provides a simple function for each of these operations while hiding all unnessecary details.
#' 
#' `ODBC.Storage.Service()` take a configuration as input and returns a list of functions, each representing a Data Store operation.
#' The first two functions: `CreateConnection` and `ExecuteQuery` is mainly used internally. 
#' However, users who wish to execute SQL Statement against an locally defined ODBC Data Source may find these helpfull.
#' The second set of functions is based on a simple Todo App example:
#' * `Insert`, take a todo as input and adds the todo to the data store.
#' * `Select`, returns a data frame contains all todo's in the data store.
#' * `SelectWhereId`, take the Id and returns the macthing todo from the data store, if it exist.
#' * `Update`, take a todo as input and update the task and status of the todo in the data store.
#' * `Delete`, that the Id of a todo and removes that todo from the data store if it exist.
#' 
#' `ODBC.Storage.Service()` also includes input validation and exception handling:
#' * The `configuration` input is expected to be a list with `DSN`, `Username` and `Password`.
#' * The `todo` input used with `Insert` and `Update` operations is expcted to be a data frame containing an `Id`, `Task` and `Status`
#' * The `id` input used with `SelectWhereId` and `Delete` operations is expcted to not be null. 
#' 
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `CreateConnection()`
#' * `ExecuteQuery(sql)`
#' * `[["Todo"]][["Insert"]](todo)`
#' * `[["Todo"]][["Select"]]()`
#' * `[["Todo"]][["SelectWhereId]](id)`
#' * `[["Todo"]][["Update"]](todo)`
#' * `[["Todo"]][["Delete"]](id)`
#' @examples
#'   configurator <- Configuration.Service()
#'   configuration <- configurator[["GetODBCConfiguration"]]()
#' 
#'   operation <- configuration |> ODBC.Storage.Service()
#' 
#'   todos <- operation[["Todo"]][["Select"]]()
#' 
#'   rm(configurator)
#'   rm(configuration)
#'   rm(operation)
#'   rm(todos)
#' @export
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
