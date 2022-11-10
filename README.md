# Storage
This R Package is used to perform common data operations on various data stores and is a [Standard](https://github.com/hassanhabib/The-Standard) compliant package.

Typical operations perform on a Data Stores, for example a SQL Database, includes `Insert`, `Select`, `Update` and `Delete`.
This `Storage` package provides a simple function for each of these operations while hiding all unnessecary details.

Current data providers includes an ODBC Data Source and Mock with Structual Validation and Exceptions Handing.

> Note: This is an experimental package which use a simple Todo App as example.

## Usage
`ODBC.Storage.Service()` or `Mock.Storage.Service()` take a configuration as input and returns a list of functions, each representing a Data Store operation.

1. Load Package
```r
library(Storage)
```

2. Create Data Store Specific Configuration
Some data stores require a `configuration` to establish a connection. For example, an ODBC Data Source requires a `configuration` with `DSN`, `Username` and `Password`.
These configuration details are considered sensitive information and typically stored as Environment Variables on the local machine. (refer to [Environment](https://github.com/FlippieCoetser/Environment) for an overview how to define the needed configuration parameters.). This `Storage` package includes a configurator used to retrieve the needed enrivonment variable and add them to a data frame configuration. 

```r
configurator <- Configuration.Service()
configuration <- configurator[["GetODBCConfiguration"]]()
```

3. Get Data Operations
Get a list of Data Operations by using the previously generated configuration 

```r
operation <- configuration |> Mock.Storage.Service()
```

### Insert
Insert a new `todo` into data store

```r
todo <- data.frame(
  Id     = uuid::UUIDgenerate(),
  Task   = 'Task',
  Status = 'New'
)

todo |> operation[["Todo"]][["Insert"]]()
```

### Select
Retieve all `todos` stored in data store

```r
todos <- operation[["Todo"]][["Select"]]()
```

### Select Specific
Retieve a specific `todo` by `Id` from data store

```r
# id of existing todo in mock data store
id <- '7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae'

todo <- id |> operation[["Todo"]][["SelectWhereId"]]()
```

### Update
Update specific `todo` in data store

```r
todo <- data.frame(
  Id     = '7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae',
  Task   = 'Task',
  Status = 'Complete'
)

todo |> operation[["Todo"]][["Update"]]()
```
### Delete
Remove `todo` from data store using `todo` `Id`

```r
# id of existing todo in mock data store
id <- '7ab3df6f-2e8f-44b4-87bf-3004cf1c16ae'

id |> operation[["Todo"]][["Delete"]]()
```

## Installation
At the time of writing this README, this `Storage` R-Package is not available on CRAN. Either user GitHub or Build and Install Locally:

### Install via GitHub
1. User Devtools

```r
devtools::install_github("https://github.com/FlippieCoetser/Storage")
```
### Build and Install Locally
1. Generate `.tar.gz` file

```r
devtools::build()
```

2. Install `.tar.gz` file
```r
install.package("path_to_file/tar_gz_file", repos = NULL, type = "source")
```

## Contibute
Contributions is encouraged and very much welcomed! Given this R-Package is [Standard](https://github.com/hassanhabib/The-Standard) compliant, any contribution is expected to follow the same principles. This package is also developed using a TDD approach. It is therefore expected that a commit with new working funtionality is preceeded with a commit contain a failing unit test or tests. Lastly, R is flexible and allows for different syntax and techniques to achieve the same outcome. Please stick to the naming and style convention used.

### Unit Tests
1. Running Unit Tests:
```r
devtools::test()
```
