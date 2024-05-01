#' Storage
#'
#' @description
#' Provide an storage interface with basic CRUD Operations with ability to switch between MOCK or ODBC Storage Provider.
#' 
#' @usage NULL
#' @returns A `list` of functions: 
#' * `execute.query(query)`
#' * `add(entity, table)`
#' * `retrieve(table, fields)`
#' * `retrieve.where.id(id, table, fields)`
#' * `modify(entity, table)`
#' * `remove(id, table)`
#' @export
Storage <- Storage.Orchestrator

