Mock.Storage.Broker <- \(configuration){
    broker <- list()
    
    broker[["Todo"]] <- list()
    broker[["Todo"]][["Todos"]] <- data.frame(
        Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
               '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
               'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
        Task   = c('Task.1','Task.2','Task.3'),
        Status = c('New','New','Done')
    )
    broker[["Todo"]][["Insert"]]        <- \(todo) {        
        broker[["Todo"]][["Todos"]] <<-
            broker[["Todo"]][["Todos"]] |>
            dplyr::rows_insert(todo, by = "Id")

        return(data.frame())
    }
    broker[["Todo"]][["Select"]]        <- \(...)  {
        broker[["Todo"]][["Todos"]]
    }
    broker[["Todo"]][["SelectWhereId"]] <- \(id)   {
        broker[["Todo"]][["Todos"]] |>
            dplyr::filter(Id == id)
    }
    broker[["Todo"]][["Update"]]        <- \(todo) {
        broker[["Todo"]][["Todos"]] <<-
            broker[["Todo"]][["Todos"]] |>
            dplyr::rows_update(todo, by = "Id")

        return(data.frame())
    }
    broker[["Todo"]][["Delete"]]        <- \(id)   {
        broker[["Todo"]][["Todos"]] <<-
            broker[["Todo"]][["Todos"]] |>
                dplyr::filter(Id != id)

        return(data.frame())
    }
    return(broker)  
}