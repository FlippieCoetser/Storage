#' Example Todo Service
#'
#' @description
#' Provide a Service which leverage the storage interface provided by this package.
#' The service includes structural and logical validation of data.
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
  services[['Add']]             <- \(todo) {
    todo |> validate[['Todo']]()
    todo |> broker[['Insert']]()
  }
  services[['Retrieve']]        <- \(...) {
    ... |> broker[['Select']]()
  }
  services[['RetrieveWhereId']] <- \(id) {
    # TODO: Extensive id pattern validation.
    # Current validation check for NULL only.
    id |> validate[['Id']]()
    id |> broker[['SelectWhereId']]()
  }
  services[['Modify']]          <- \(todo) {
    todo |> validate[['Todo']]()
    todo |> broker[['Update']]()
  }
  services[['Remove']]          <- \(id) {
    # TODO: Extensive id pattern validation.
    # Current validation check for NULL only.
    id |> validate[['Id']]()
    id |> broker[['Delete']]()
  }
  return(services)
}