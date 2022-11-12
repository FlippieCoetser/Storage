#' Mock Data Access Layer
#'
#' @description
#' Typical operations perform on a Data Stores, for example a SQL Database, includes `Insert`, `Select`, `Update` and `Delete`.
#' This `Storage` package provides a simple function for each of these operations while hiding all unnessecary details.
#'
#' `Mock.Storage.Service()` take a configuration as input and returns a list of functions, each representing a Data Store operation.
#' The list of functions is based on a simple Todo App example:
#' * `Insert`, take a todo as input and adds the todo to the data store.
#' * `Select`, returns a data frame contains all todo's in the data store.
#' * `SelectWhereId`, take the Id and returns the macthing todo from the data store, if it exist.
#' * `Update`, take a todo as input and update the task and status of the todo in the data store.
#' * `Delete`, that the Id of a todo and removes that todo from the data store if it exist.
#'
#' `Mock.Storage.Service()` also includes input validation and exception handling:
#' * The `configuration` input is expected to be a list with `DSN`, `Username` and `Password`.
#' * The `todo` input used with `Insert` and `Update` operations is expcted to be a data frame containing an `Id`, `Task` and `Status`
#' * The `id` input used with `SelectWhereId` and `Delete` operations is expcted to not be null.
#'
#' @usage NULL
#' @returns A `list` of utility functions:
#' * `[["Todo"]][["Insert"]](todo)`
#' * `[["Todo"]][["Select"]]()`
#' * `[["Todo"]][["SelectWhereId]](id)`
#' * `[["Todo"]][["Update"]](todo)`
#' * `[["Todo"]][["Delete"]](id)`
#' @examples
#'   configurator <- Configuration.Service()
#'   configuration <- configurator[["GetODBCConfiguration"]]()
#'
#'   operation <- configuration |> Mock.Storage.Service()
#'
#'   todos <- operation[["Todo"]][["Select"]]()
#'
#'   rm(configurator)
#'   rm(configuration)
#'   rm(operation)
#'   rm(todos)
#' @export
Mock.Storage.Service <- \(configuration){
    storage.validate <- Mock.Storage.Validation.Service()
    configuration |> storage.validate[["Configuration"]]()

    validate <- Model.Validation.Service()
    broker    <- configuration |> Mock.Storage.Broker()

    service <- list()
    service[["Todo"]] <- list()
    service[["Todo"]][["Insert"]]        <- \(todo) {
        todos <- broker[["Todo"]][["Todos"]]

        todo |>
            validate[["Todo"]]() |>
            validate[['IsDuplicate']](todos) |>
            broker[['Todo']][['Insert']]()

        return(data.frame())
    }
    service[["Todo"]][["Select"]]        <- \(...)  {
        broker[['Todo']][['Select']]()
    }
    service[["Todo"]][["SelectWhereId"]] <- \(id)   {
        id |>
            validate[["Id"]]() |>
            broker[['Todo']][['SelectWhereId']]()
    }
    service[["Todo"]][["Update"]]        <- \(todo) {
        todo |>
            validate[["Todo"]]() |>
            broker[['Todo']][['Update']]()

        return(data.frame())
    }
    service[["Todo"]][["Delete"]]        <- \(id)   {
        id |>
            validate[["Id"]]() |>
            broker[['Todo']][['Delete']]()

        return(data.frame())
    }

    return(service)
}
