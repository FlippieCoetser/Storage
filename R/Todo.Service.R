#' Example Todo Service
#'
#' @description
#' Provide a Service which leverage the storage interface provided by this package.
#' The service includes structural and logical validation of data.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `add(todo)`
#' * `retrieve(...)`
#' * `retrieve.where.id(id)`
#' * `modify(todo)`
#' * `remove(id)`
#' @export
Todo.Service <- \(broker) {
  validate <- Todo.Validator()
  
  services <- list()
  services[['add']]             <- \(todo) {
    todo |> validate[['Todo']]()
    todo |> broker[['insert']]()
  }
  services[['retrieve']]        <- \(...) {
    ... |> broker[['select']]()
  }
  services[['retrieve.where.id']] <- \(id) {
    # TODO: Extensive id pattern validation.
    # Current validation check for NULL only.
    id |> validate[['Id']]()
    id |> broker[['select.where.Id']]()
  }
  services[['modify']]          <- \(todo) {
    todo |> validate[['Todo']]()
    todo |> broker[['update']]()
  }
  services[['remove']]          <- \(id) {
    # TODO: Extensive id pattern validation.
    # Current validation check for NULL only.
    id |> validate[['Id']]()
    id |> broker[['delete']]()
  }
  return(services)
}