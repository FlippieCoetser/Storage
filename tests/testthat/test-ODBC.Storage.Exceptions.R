describe("ODBC.Storage.Exceptions",{
  it("Exist",{
    ODBC.Storage.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- ODBC.Storage.Exceptions()",{
  it('then exceptions is a list',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exceptions contains ConfigIsNull exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['ConfigIsNull']] |> expect.exist()
  })
  it("then exceptions contains ConfigIsMissing exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['ConfigIsMissing']] |> expect.exist()
  })
  it("then exceptions contains dsnIsNull exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['dsnIsNull']] |> expect.exist()
  })
  it("then exceptions contains uidIsNull exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['uidIsNull']] |> expect.exist()
  })
  it("then exceptions contains pwdIsNull exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['pwdIsNull']] |> expect.exist()
  })
  it("then exceptions contains Connection exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Connection']] |> expect.exist()
  })
  it("then exceptions contains ServerUnreachable exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['ServerUnreachable']] |> expect.exist()
  })
  it("then exceptions contains InvalidDSN exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['InvalidDSN']] |> expect.exist()
  })
  it("then exceptions contains LoginFailed exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['LoginFailed']] |> expect.exist()
  })
  it("then exceptions contains Query exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['Query']] |> expect.exist()
  })
  it("then exceptions contains DuplicateKey exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['DuplicateKey']] |> expect.exist()
  })
  it("then exceptions contains NullValue exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['NullValue']] |> expect.exist()
  })
  it("then exceptions contains ConversionFailed exception",{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['ConversionFailed']] |> expect.exist()
  })
  it('then exceptions contains QueryIsNull exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['QueryIsNull']] |> expect.exist()
  })
  it('then exceptions contains InvalidType exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['InvalidType']] |> expect.exist()
  })
  it('then exceptions contains InvalidRows exception',{
    # Given
    exceptions <- ODBC.Storage.Exceptions()

    # Then
    exceptions[['InvalidRows']] |> expect.exist()
  })
})

describe("when input |> exception[['ConfigIsNull']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["ConfigIsNull"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration provided is null. Provide valid configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[["ConfigIsNull"]]() |> expect_error(expected.error)
  })
})

describe("when input |> exception[['ConfigIsMissing']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["ConfigIsMissing"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'No configuration provided but required. Provide configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[["ConfigIsMissing"]]() |> expect_error(expected.error)
  })
})

describe("when input |> exception[['DSNIsNull']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['dsnIsNull']]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration has no DSN. Add DSN to configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[['dsnIsNull']]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['uidIsNull']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['uidIsNull']]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration has no UID. Add UID to configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[['uidIsNull']]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['pwdIsNull']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['pwdIsNull']]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Configuration has no PWD. Add PWD to configuration'

    # When
    input <- TRUE

    # Then
    input |> exception[['pwdIsNull']]() |> expect_error(expected.error)
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

describe("When input |> exception[['ServerUnreachable']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["ServerUnreachable"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'TCP Provider: Timeout error, Try again!'

    # When
    input <- TRUE

    # Then
    input |> exception[["ServerUnreachable"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['InvalidDSN']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["InvalidDSN"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'ODBC Driver: Invalid DSN'

    # When
    input <- TRUE

    # Then
    input |> exception[["InvalidDSN"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['LoginFailed']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["LoginFailed"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'ODBC Driver: Login Failed, check credentials'

    # When
    input <- TRUE

    # Then
    input |> exception[["LoginFailed"]]() |> expect_error(expected.error)
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

describe("When input |> exception[['DuplicateKey']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["DuplicateKey"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'SQL Error: Duplicate Id not allowed'

    # When
    input <- TRUE

    # Then
    input |> exception[["DuplicateKey"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['NullValue']]()",{
  it('then no exception is thrown if input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["NullValue"]]() |> expect_no_error()
  })
  it('then an exception is thrown if input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'SQL Error: NULL value not allowed'

    # When
    input <- TRUE

    # Then
    input |> exception[["NullValue"]]() |> expect_error(expected.error)
  })
})

describe("When input |> exception[['ConversionFailed']]()",{
  it('then no exception is thrown if input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["ConversionFailed"]]() |> expect_no_error()
  })
  it('then an exception is thrown if input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'SQL Error: Conversion from a character to unique identifier failed'

    # When
    input <- TRUE

    # Then
    input |> exception[["ConversionFailed"]]() |> expect_error(expected.error)
  })
})

describe("when input |> exception[['QueryIsNull']]()",{
  it('then no exception is thrown when input is FALSE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["QueryIsNull"]]() |> expect_no_error()
  })
  it('then an exception is thrown when input is TRUE',{
    # Given
    exception <- ODBC.Storage.Exceptions()

    expected.error <- 'Query is null. Provide a Query.'

    # When
    input <- TRUE

    # Then
    input |> exception[["QueryIsNull"]]() |> expect_error(expected.error)
  })
})