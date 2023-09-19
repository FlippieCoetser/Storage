describe('ODBC.Configuration.Validator',{
  it('Exist',{
    ODBC.Configuration.Validator |> expect.exist()
  })
})

describe("When validators <- ODBC.Configuration.Validator()",{
  it("then validators is a list",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators |> expect.list()
  })
  it('then validators contains PresetConfig validator',{
   # When
   validators <- ODBC.Configuration.Validator()
   
   # Then
   validators[['PresetConfig']] |> expect.exist()
  })
  it('then validators contains ManualConfig validator',{
   # When
   validators <- ODBC.Configuration.Validator()
   
   # Then
   validators[['ManualConfig']] |> expect.exist()
  })
  it("then validators contains HasDrv validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDrv']] |> expect.exist()
  })
  it("then validators contains HasDsn validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDsn']] |> expect.exist()
  })
  it("then validators contains HasDriver validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDriver']] |> expect.exist()
  })
  it("then validators contains HasServer validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasServer']] |> expect.exist()
  })
  it("then validators contains HasDatabase validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasDatabase']] |> expect.exist()
  })
  it("then validators contains HasUid validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasUid']] |> expect.exist()
  })
  it("then validators contains HasPwd validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['HasPwd']] |> expect.exist()
  })
})

describe("When configuration |> validate[['HasDrv']]()",{
  it("then no exception is thrown if drv is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'  
    
    # Then
    input.configuration |> validate[['HasDrv']]() |> expect.no.error()
  })
  it("then an exception is thrown if drv is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "drv is NULL. Valid configuration requires a drv."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- NULL 
    
    # Then
    input.configuration |> validate[['HasDrv']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has drv",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['HasDrv']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['HasDsn']]()",{
  it("then no exception is thrown if dsn is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['dsn']] <- 'test'  
    
    # Then
    input.configuration |> validate[['HasDsn']]() |> expect.no.error()
  })
  it("then an exception is thrown if dsn is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "dsn is NULL. Valid configuration requires a dsn."
    
    # When
    input.configuration <- list()
    input.configuration[['dsn']] <- NULL 
    
    # Then
    input.configuration |> validate[['HasDsn']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has dsn",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['dsn']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['HasDsn']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['HasDriver']]()",{
  it("then no exception is thrown if driver is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['driver']] <- 'test'  
    
    # Then
    input.configuration |> validate[['HasDriver']]() |> expect.no.error()
  })
  it("then an exception is thrown if driver is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "driver is NULL. Valid configuration requires a driver."
    
    # When
    input.configuration <- list()
    input.configuration[['driver']] <- NULL 
    
    # Then
    input.configuration |> validate[['HasDriver']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has driver",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['driver']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['HasDriver']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['HasServer']]()",{
  it("then no exception is thrown if server is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['server']] <- 'test'  
    
    # Then
    input.configuration |> validate[['HasServer']]() |> expect.no.error()
  })
  it("then an exception is thrown if server is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "server is NULL. Valid configuration requires a server."
    
    # When
    input.configuration <- list()
    input.configuration[['server']] <- NULL 
    
    # Then
    input.configuration |> validate[['HasServer']]() |> expect.error(expected.error)
  })
})