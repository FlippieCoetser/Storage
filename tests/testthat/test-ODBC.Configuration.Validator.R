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
  it("then validators contains Configuration validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Configuration']] |> expect.exist()
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
  it("then configuration is returned if configuration has server",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['server']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['HasServer']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['HasDatabase']]()",{
  it("then no exception is thrown if database is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['database']] <- 'test'  
    
    # Then
    input.configuration |> validate[['HasDatabase']]() |> expect.no.error()
  })
  it("then an exception is thrown if database is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "database is NULL. Valid configuration requires a database."
    
    # When
    input.configuration <- list()
    input.configuration[['database']] <- NULL 
    
    # Then
    input.configuration |> validate[['HasDatabase']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has database",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['database']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['HasDatabase']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['HasUid']]()",{
  it("then no exception is thrown if uid is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['uid']] <- 'test'  
    
    # Then
    input.configuration |> validate[['HasUid']]() |> expect.no.error()
  })
  it("then an exception is thrown if uid is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "uid is NULL. Valid configuration requires a uid."
    
    # When
    input.configuration <- list()
    input.configuration[['uid']] <- NULL 
    
    # Then
    input.configuration |> validate[['HasUid']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has uid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['uid']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['HasUid']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['HasPwd']]()",{
  it("then no exception is thrown if pwd is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['pwd']] <- 'test'  
    
    # Then
    input.configuration |> validate[['HasPwd']]() |> expect.no.error()
  })
  it("then an exception is thrown if pwd is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "pwd is NULL. Valid configuration requires a pwd."
    
    # When
    input.configuration <- list()
    input.configuration[['pwd']] <- NULL 
    
    # Then
    input.configuration |> validate[['HasPwd']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has pwd",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['pwd']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['HasPwd']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['PresetConfig']]()",{
  it("then no exception is thrown if configuration is valid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- 'test'
    
    # Then
    input.configuration |> validate[['PresetConfig']]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no drv",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "drv is NULL. Valid configuration requires a drv."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- NULL
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- 'test'
    
    # Then
    input.configuration |> validate[['PresetConfig']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has no dsn",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "dsn is NULL. Valid configuration requires a dsn."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    input.configuration[['dsn']] <- NULL
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- 'test'
    
    # Then
    input.configuration |> validate[['PresetConfig']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has no uid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "uid is NULL. Valid configuration requires a uid."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- NULL
    input.configuration[['pwd']] <- 'test'
    
    # Then
    input.configuration |> validate[['PresetConfig']]() |> expect.error(expected.error)
  }) 
  it("then an exception is thrown if configuration has no pwd",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "pwd is NULL. Valid configuration requires a pwd."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- NULL
    
    # Then
    input.configuration |> validate[['PresetConfig']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration is valid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['PresetConfig']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['ManualConfig']]()",{
  it("then no exception is thrown if configuration is valid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['ManualConfig']]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no drv",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "drv is NULL. Valid configuration requires a drv."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- NULL
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['ManualConfig']]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if configuration has no driver",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "driver is NULL. Valid configuration requires a driver."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- NULL
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['ManualConfig']]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if configuration has no server",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "server is NULL. Valid configuration requires a server."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- NULL
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['ManualConfig']]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if configuration has no database",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "database is NULL. Valid configuration requires a database."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- NULL
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['ManualConfig']]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if configuration has no uid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "uid is NULL. Valid configuration requires a uid."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- NULL
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['ManualConfig']]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if configuration has no pwd",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "pwd is NULL. Valid configuration requires a pwd."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- NULL
    
    # Then
    input.configuration |> validate[['ManualConfig']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration is valid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['ManualConfig']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Configuration']]()",{
  it("then no exception is thrown if configuration is valid Preset configuration",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- 'test'
    
    # Then
    input.configuration |> validate[['Configuration']]() |> expect.no.error()
  })
  it("then no exception is thrown if configuration is valid Manual configuration",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- 'test'
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['Configuration']]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration is invalid Preset configuration",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "Invalid ODBC configuration. Provide valid Preset or Manual configuration."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- NULL
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- 'test'
    
    # Then
    input.configuration |> validate[['Configuration']]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration is invalid Manual configuration",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "Invalid ODBC configuration. Provide valid Preset or Manual configuration."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']]      <- 'test'
    input.configuration[['driver']]   <- NULL
    input.configuration[['server']]   <- 'test'
    input.configuration[['database']] <- 'test'
    input.configuration[['uid']]      <- 'test'
    input.configuration[['pwd']]      <- 'test'
    
    # Then
    input.configuration |> validate[['Configuration']]() |> expect.error(expected.error)
  })
})