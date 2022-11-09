Model.Exceptions <- \() {
  exception <- list()

  exception[["TodoIsNull"]]   <- \(invoke) {
    if (invoke) { stop("Successfull validation requires a todo dataframe")}
  }
  exception[["IdIsNull"]]     <- \(invoke) {
    if (invoke) { stop("Todo data frame has no Id")}
  }
  exception[["TaskIsNull"]]   <- \(invoke) {
    if (invoke) { stop("Todo data frame has no Task")}
  }
  exception[["StatusIsNull"]] <- \(invoke) {
    if (invoke) { stop("Todo data frame has no Status")}
  }

  exception[["NoId"]]  <- \(invoke) {
    if (invoke) { stop("Successfull validation requires an Id")}
  }

  exception[["DuplicateKey"]]         <- \(invoke) {
      if (invoke) { stop("Duplicate Id not allowed") }
  }

  return(exception)
}
