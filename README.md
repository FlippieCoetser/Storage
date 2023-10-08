# Storage

![r-universe](https://flippiecoetser.r-universe.dev/badges/Storage)

This R Package provides a common interface for performing data operations on various data stores. Currently, an `memory` and `odbc` driver based `Storage` is supported. To configure an `odbc` driver-based data store, a `ODBC.Configurator` is made available to retrieve the required configuration parameters from a local `.Renviron` file. Lastly, a `Todo.Service`, is provided as an example of how to use the `Storage` component can be injected into a data service.

Below is an overview of the different functions available on each of the components:

## ODBC Configurator

Two utility functions are provided:

1. `Open.Config.File`  
   Opens the `.Renviron` file in your IDE. This function only works when using either VS Code or RStudio.

2. `Get.Config`  
   Retrieves the configuration parameters from your local `.Renviron` file. By default a preset configuration is assumed when an OS DSN has been set up. A preset type configuration assumes a `DSN`, `UID` and `PWD` variables have been defined in the `.Renviron` file. If no OS DSN has been set up, `Get.Config` can be invoked with `type = 'Manual'` flag. When retrieving configuration parameters using the `type = 'Manual'` flag it is assumed `DRIVER`, `SERVER`, `DATABASE`, `UID`, `PWD` variables have been defined in the `.Renviron` file.

## Storage Component

Six functions are provided, five of which are common data operations and one function to execute custom queries:

1. `Add`
2. `Retrieve`
3. `RetrieveWhereId`
4. `Modify`
5. `Remove`

Custom data operations can be added using the `Execute.Query` function. The `Execute.Query` function takes a SQL `query`, passed in as a character data type, and returns a data frame.

## Todo Data Service

Five functions are provided:

1. `Add`
2. `Retrieve`
3. `RetrieveWhereId`
4. `Modify`
5. `Remove`

The `Todo.Service` is an example of how to use the `Storage` component. The `Todo.Service` is a simple data service that performs CRUD operations on a `Todo` data model.

> Note: This package is a [Standard](https://github.com/hassanhabib/The-Standard) compliant package.

## Installation

At the time of writing this README, the package is not available on CRAN. However, it can be installed using `devtools`.

#### Install Dependencies

1. This package has two dependencies: `Validate`, `Environment`, `Query`:

```r
devtools::install_github("https://github.com/FlippieCoetser/Validate")
devtools::install_github("https://github.com/FlippieCoetser/Environment")
devtools::install_github("https://github.com/FlippieCoetser/Query")
```

### Install via GitHub

1. Use Devtools

```r
devtools::install_github("https://github.com/FlippieCoetser/Storage")
```

### Clone, Build and Install Locally

1. Clone the repository

```bash
git clone https://github.com/FlippieCoetser/Storage.git
```

2. Build and Generate `.tar.gz` file

```r
devtools::build()
```

3. Install the package

```r
install.packages("path_to_file/tar_gz_file", repos = NULL, type = "source")
```

## Loading the Package

There are two ways to load the package:

1. User the library function to load all available components into the global namespace
2. Create a new instance of a component using the package namespace

### User Global Namespace

Three components are loaded into the global namespace when using the library function to load the package.

```r
library(Storage)
```

### User Package Namespace

When using the package namespace, the three components can be accessed as follows:

```r
Storage::ODBC.Configurator()
Storage::Storage()
Storage::Todo.Service()
```

# Usage

Using the `Todo.Service` component two uses cases will be demonstrated, one using a `memory` data store and the other using an `odbc` data store.

## Initialize

### In-Memory Data Store

1. Create an empty `configuration`

```r
configuration <- list()
```

2. Create a new instance of the `Storage` component with `type = 'memory'`.

```r
storage <- configuration |> Storage::Storage(type = 'memory')
```

### ODBC Data Store

1. Create a new instance of `ODBC.Configurator`

```r
odbc.configurator <- Storage::ODBC.Configurator()
```

2. Retrieve the configuration parameters from the local `.Renviron` file

```r
configuration <- odbc.configurator[['Get.Config']]()
```

3. Create a new instance of `Storage` component.

```r
storage <- configuration |> Storage::Storage()
```

## Use Cases

1. When using a storage with a `memory` based store, seed the store with mock data

```r
table <- 'Todo'
data <- data.frame(
  Id     = c('7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
            '7bfef861-6fe9-46da-9ad2-6a58779ccdcd',
            'd3b59bf0-14f0-4444-9ec9-1913e7256ee4'),
  Task   = c('Task.1','Task.2','Task.3'),
  Status = c('New','New','Done')
)

data |> storage[['Seed.Table']](table)
```

2. select a `storage` instance based on your desired data store and create a new `Todo.Service` instance

```r
todo.service <- storage |> Todo.Broker() |> Todo.Service()
```

### Add Todo

1. Create a new `todo`

```r
todo <- data.frame(
  Id     = uuid::UUIDgenerate(),
  Task   = "Task",
  Status = "New"
)
```

2. Add the `todo` into the data store

```r
todo |> todo.service[['Add']]()
```

### Retrieve Todos

1. Retrieve all `todos` in the data store

```r
todos <- todo.service[['Retrieve']]()
```

### Retrieve Todo Where Id

1. Use the `todo` created in a previous step and extract its `Id`

```r
id   <- todo[['Id']]
```

2. Retrieve the `todo` with the extracted `Id`

```r
todo <- id |> todo.service[['RetrieveWhereId']]()
```

### Modify Todo

1. Use the `todo` retrieved in the previous step and update its `Status`

```r
todo[['Status']] <- "Done"
```

2. Modify the `todo` in the data store

```r
todo |> todo.service[['Modify']]()
```

### Remove Todo

1. Use the `todo` retrieved in the previous step and extract its `Id`

```r
id <- todo[['Id']]
```

2. Remove the `todo` with the extracted `Id`

```r
id |> todo.service[['Remove']]()
```
