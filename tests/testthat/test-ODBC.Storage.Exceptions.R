describe('ODBC.Storage.Exceptions',{
  it('Exist',{
    ODBC.Storage.Exceptions |> expect.exist()
  })
})

describe('When exceptions <- ODBC.Storage.Exceptions()',{
  it('then exceptions is a list',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it('then exceptions contains Config.NULL exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Config.NULL']] |> expect.exist()
  })
  it('then exceptions contains Config.Missing exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Config.Missing']] |> expect.exist()
  })
  it('then exceptions contains Dsn.NULL exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Dsn.NULL']] |> expect.exist()
  })
  it('then exceptions contains Uid.NULL exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Uid.NULL']] |> expect.exist()
  })
  it('then exceptions contains Pwd.NULL exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Pwd.NULL']] |> expect.exist()
  })
  it('then exceptions contains Connection exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Connection']] |> expect.exist()
  })
  it('then exceptions contains Server.Unreachable exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Server.Unreachable']] |> expect.exist()
  })
  it('then exceptions contains DSN.Invalid exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['DSN.Invalid']] |> expect.exist()
  })
  it('then exceptions contains Login.Failed exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Login.Failed']] |> expect.exist()
  })
  it('then exceptions contains Query exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Query']] |> expect.exist()
  })
  it('then exceptions contains Key.Duplicate exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Key.Duplicate']] |> expect.exist()
  })
  it('then exceptions contains Value.NULL exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Value.NULL']] |> expect.exist()
  })
  it('then exceptions contains Conversion.Failed exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Conversion.Failed']] |> expect.exist()
  })
  it('then exceptions contains Query.NULL exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Query.NULL']] |> expect.exist()
  })
})

describe("when input |> exception[['Config.NULL']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Config.NULL"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration provided is null. Provide valid configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[["Config.NULL"]]() |> expect_error(expected.error)
  })
})

describe("when input |> exception[['Config.Missing']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Config.Missing"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'No configuration provided but required. Provide configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[["Config.Missing"]]() |> expect_error(expected.error)
  })
})

describe("when input |> exception[['DSNIsNull']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Dsn.NULL']]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration has no DSN. Add DSN to configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[['Dsn.NULL']]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Uid.NULL']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Uid.NULL']]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration has no UID. Add UID to configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[['Uid.NULL']]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Pwd.NULL']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['Pwd.NULL']]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration has no PWD. Add PWD to configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[['Pwd.NULL']]() |> expect_error(expected.error)
  })    
})

describe("When input |> exception[['Connection']]()",{
  it('then no exception is thrown if input is "test"',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- 'test'

    # Then
    input |> exception[["Connection"]]() |> expect_no_error()
  })
  it('then an exception is thrown if input contains 08001',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'TCP Provider: Timeout error, Try again!'

    # When
    input <- '08001'

    # Then
    input |> exception[["Connection"]]() |> expect_error(expected.error)
  })
  it('then an exception is thrown if input contains IM002',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'ODBC Driver: Invalid DSN'

    # When
    input <- 'IM002'

    # Then
    input |> exception[["Connection"]]() |> expect_error(expected.error)
  })
  it('then an exception is thrown if input contains 28000',{
    # Given
    exception <- ODBC.Storage.Exceptions()
    
    expected.error <- 'ODBC Driver: Login Failed, check credentials'
    
    # When
    input <- '28000'
    
    # Then
    input |> exception[["Connection"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Server.Unreachable']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Server.Unreachable"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'TCP Provider: Timeout error, Try again!'

    # When
    input <- TRUE

    # Then
    input |> exception[["Server.Unreachable"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['DSN.Invalid']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["DSN.Invalid"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'ODBC Driver: Invalid DSN'

    # When
    input <- TRUE

    # Then
    input |> exception[["DSN.Invalid"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Login.Failed']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Login.Failed"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'ODBC Driver: Login Failed, check credentials'

    # When
    input <- TRUE

    # Then
    input |> exception[["Login.Failed"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Query']]()",{
  it('then an exception is thrown if input contains Duplicate Id',{
    # Given
    exception <- ODBC.Storage.Exceptions()
    
    expected.error <- 'SQL Error: Duplicate Id not allowed'
    
    # When
    input <- 'Violation of PRIMARY KEY constraint'
    
    # Then
    input |> exception[["Query"]]() |> expect_error(expected.error)
  })
  it('then an exception is thrown if input contains NULL value',{
    # Given
    exception <- ODBC.Storage.Exceptions()
    
    expected.error <- 'SQL Error: NULL value not allowed'
    
    # When
    input <- 'Cannot insert the value NULL into column'
    
    # Then
    input |> exception[["Query"]]() |> expect_error(expected.error)
  })
  it('then an exception is thrown if input contains Conversion failed',{
    # Given
    exception <- ODBC.Storage.Exceptions()
    
    expected.error <- 'SQL Error: Conversion from a character to unique identifier failed'
    
    # When
    input <- 'Conversion failed when converting from a character string to uniqueidentifier'
    
    # Then
    input |> exception[["Query"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Key.Duplicate']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Key.Duplicate"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'SQL Error: Duplicate Id not allowed'

    # When
    input <- TRUE

    # Then
    input |> exception[["Key.Duplicate"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Value.NULL']]()",{
  it('then no exception is thrown if input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Value.NULL"]]() |> expect_no_error()
  })
  it('then an exception is thrown if input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'SQL Error: NULL value not allowed'

    # When
    input <- TRUE

    # Then
    input |> exception[["Value.NULL"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['Conversion.Failed']]()",{
  it('then no exception is thrown if input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Conversion.Failed"]]() |> expect_no_error()
  })
  it('then an exception is thrown if input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'SQL Error: Conversion from a character to unique identifier failed'

    # When
    input <- TRUE

    # Then
    input |> exception[["Conversion.Failed"]]() |> expect_error(expected.error)
  })
})

describe("when input |> exception[['Query.NULL']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["Query.NULL"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    input <- TRUE

    # Then
    input |> exception[["Query.NULL"]]() |> expect_error(expected.error)
  })
})
