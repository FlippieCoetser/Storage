#' Storage Server
#'
#' @description
#' Provide an storage interface with basic CRUD Operations with ability to switch between MOCK or ODBC Storage Provider.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `Insert(todo)`
#' * `Select(...)`
#' * `SelectWhereId(id)`
#' * `Update(todo)`
#' * `Delete(id)`
#' @export
Todo.Service <- \(broker) {
  validate <- Todo.Model.Validator()
  
  services <- list()
  services[['Insert']]        <- \(todo) {
    todo |> validate[['Todo']]()
    todo |> broker[['Insert']]()
  }
  services[['Select']]        <- \(...) {
    ... |> broker[['Select']]()
  }
  services[['SelectWhereId']] <- \(id) {
    # TODO: Extensive id pattern validation.
    # Current validation check for NULL only.
    id |> validate[['Id']]()
    id |> broker[['SelectWhereId']]()
  }
  services[['Update']]        <- \(todo) {
    todo |> validate[['Todo']]()
    todo |> broker[['Update']]()
  }
  services[['Delete']]        <- \(id) {
    # TODO: Extensive id pattern validation.
    # Current validation check for NULL only.
    id |> validate[['Id']]()
    id |> broker[['Delete']]()
  }
  return(services)
}