Model.Validation.Service <- \(){
    exception <- Model.Exceptions()
    validate <- list()

    validate[["Todo"]] <- \(todo) {
        todo |>
            validate[["TodoExist"]]() |>
            validate[["HasId"]]() |>
            validate[["HasTask"]]() |>
            validate[["HasStatus"]]()  
    }
    validate[["TodoExist"]] <- \(todo) {
        todo |> is.null() |> exception[["TodoIsNull"]]()
        return(todo)
    }
    validate[["HasId"]]     <- \(todo) {
        todo[["Id"]] |> is.null() |> exception[["IdIsNull"]]()
        return(todo)
    }
    validate[["HasTask"]]   <- \(todo) {
        todo[["Task"]] |> is.null() |> exception[["TaskIsNull"]]()
        return(todo)
    }
    validate[["HasStatus"]] <- \(todo) {
        todo[["Status"]] |> is.null() |> exception[["StatusIsNull"]]()
        return(todo)
    }

    validate[["Id"]] <- \(id) {
        id |> is.null() |> exception[["NoId"]]()
        return(id)
    }

    validate[["IsDuplicate"]] <- \(todo,todos) {
        matches <- 
            todos |> 
                dplyr::filter(Id == todo[["Id"]]) |> 
                nrow()
        
        (matches != 0) |> exception[["DuplicateKey"]]()

        return(todo)
    }

    return(validate)
}