#' Storage
#'
#' @description
#' Provide an storage interface with basic CRUD Operations with ability to switch between MOCK or ODBC Storage Provider.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `ExecuteQuery(query)`
#' * `Add(entity, table)`
#' * `Retrieve(table, fields)`
#' * `RetrieveWhereId(id, table, fields)`
#' * `Modify(entity, table)`
#' * `Remove(id, table)`
#' @export
Storage <- Storage.Orchestrator

