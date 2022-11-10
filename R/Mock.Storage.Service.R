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

    todos <- data.frame(
        Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
               '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
               'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
        Task   = c('Task.1','Task.2','Task.3'),
        Status = c('New','New','Done')
    )
    
    model.validate <- Model.Validation.Service()

    service <- list()
    service[["Todo"]] <- list()
    service[["Todo"]][["Insert"]]        <- \(todo) {
        todo |> 
            model.validate[["Todo"]]() |>
            model.validate[['IsDuplicate']](todos)
        
        todos <<-
            todos |>
            dplyr::rows_insert(todo, by = "Id")

        return(data.frame())
    }
    service[["Todo"]][["Select"]]        <- \(...)  {
        todos
    }
    service[["Todo"]][["SelectWhereId"]] <- \(id)   {
        id |> model.validate[["Id"]]()

        todos |>
            dplyr::filter(Id == id)
    }
    service[["Todo"]][["Update"]]        <- \(todo) {
        todo |>
            model.validate[["Todo"]]() 

        todos <<-
            todos |>
            dplyr::rows_update(todo, by = "Id")

        return(data.frame())
    }
    service[["Todo"]][["Delete"]]        <- \(id)   {
        id |>
            model.validate[["Id"]]()

        todos <<-
            todos |>
                dplyr::filter(Id != id)

        return(data.frame())
    }

    return(service)
}