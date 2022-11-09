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