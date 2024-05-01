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
  it("then validators contains 'Configuration' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Configuration']] |> expect.exist()
  })
  it("then validators contains 'preset.config' validator",{
   # When
   validators <- ODBC.Configuration.Validator()
   
   # Then
   validators[['preset.config']] |> expect.exist()
  })
  it("then validators contains 'manual.config' validator",{
   # When
   validators <- ODBC.Configuration.Validator()
   
   # Then
   validators[['manual.config']] |> expect.exist()
  })
  it("then validators contains 'has.drv' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['has.drv']] |> expect.exist()
  })
  it("then validators contains 'has.dsn' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['has.dsn']] |> expect.exist()
  })
  it("then validators contains 'has.driver' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['has.driver']] |> expect.exist()
  })
  it("then validators contains 'has.server' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['has.server']] |> expect.exist()
  })
  it("then validators contains 'has.database' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['has.database']] |> expect.exist()
  })
  it("then validators contains 'has.uid' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['has.uid']] |> expect.exist()
  })
  it("then validators contains 'has.pwd' validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['has.pwd']] |> expect.exist()
  })
})

describe("When configuration |> validate[['has.drv']]()",{
  it("then no exception is thrown if drv is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'  
    
    # Then
    input.configuration |> validate[['has.drv']]() |> expect.no.error()
  })
  it("then an exception is thrown if drv is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "drv is NULL. Valid configuration requires a drv."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- NULL 
    
    # Then
    input.configuration |> validate[['has.drv']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has drv",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['has.drv']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['has.dsn']]()",{
  it("then no exception is thrown if dsn is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['dsn']] <- 'test'  
    
    # Then
    input.configuration |> validate[['has.dsn']]() |> expect.no.error()
  })
  it("then an exception is thrown if dsn is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "dsn is NULL. Valid configuration requires a dsn."
    
    # When
    input.configuration <- list()
    input.configuration[['dsn']] <- NULL 
    
    # Then
    input.configuration |> validate[['has.dsn']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has dsn",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['dsn']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['has.dsn']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['has.driver']]()",{
  it("then no exception is thrown if driver is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['driver']] <- 'test'  
    
    # Then
    input.configuration |> validate[['has.driver']]() |> expect.no.error()
  })
  it("then an exception is thrown if driver is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "driver is NULL. Valid configuration requires a driver."
    
    # When
    input.configuration <- list()
    input.configuration[['driver']] <- NULL 
    
    # Then
    input.configuration |> validate[['has.driver']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has driver",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['driver']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['has.driver']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['has.server']]()",{
  it("then no exception is thrown if server is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['server']] <- 'test'  
    
    # Then
    input.configuration |> validate[['has.server']]() |> expect.no.error()
  })
  it("then an exception is thrown if server is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "server is NULL. Valid configuration requires a server."
    
    # When
    input.configuration <- list()
    input.configuration[['server']] <- NULL 
    
    # Then
    input.configuration |> validate[['has.server']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has server",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['server']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['has.server']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['has.database']]()",{
  it("then no exception is thrown if database is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['database']] <- 'test'  
    
    # Then
    input.configuration |> validate[['has.database']]() |> expect.no.error()
  })
  it("then an exception is thrown if database is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "database is NULL. Valid configuration requires a database."
    
    # When
    input.configuration <- list()
    input.configuration[['database']] <- NULL 
    
    # Then
    input.configuration |> validate[['has.database']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has database",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['database']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['has.database']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['has.uid']]()",{
  it("then no exception is thrown if uid is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['uid']] <- 'test'  
    
    # Then
    input.configuration |> validate[['has.uid']]() |> expect.no.error()
  })
  it("then an exception is thrown if uid is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "uid is NULL. Valid configuration requires a uid."
    
    # When
    input.configuration <- list()
    input.configuration[['uid']] <- NULL 
    
    # Then
    input.configuration |> validate[['has.uid']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has uid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['uid']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['has.uid']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['has.pwd']]()",{
  it("then no exception is thrown if pwd is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['pwd']] <- 'test'  
    
    # Then
    input.configuration |> validate[['has.pwd']]() |> expect.no.error()
  })
  it("then an exception is thrown if pwd is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "pwd is NULL. Valid configuration requires a pwd."
    
    # When
    input.configuration <- list()
    input.configuration[['pwd']] <- NULL 
    
    # Then
    input.configuration |> validate[['has.pwd']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has pwd",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['pwd']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['has.pwd']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['preset.config']]()",{
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
    input.configuration |> validate[['preset.config']]() |> expect.no.error()
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
    input.configuration |> validate[['preset.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['preset.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['preset.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['preset.config']]() |> expect.error(expected.error)
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
    actual.configuration <- input.configuration |> validate[['preset.config']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['manual.config']]()",{
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
    input.configuration |> validate[['manual.config']]() |> expect.no.error()
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
    input.configuration |> validate[['manual.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['manual.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['manual.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['manual.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['manual.config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['manual.config']]() |> expect.error(expected.error)
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
    actual.configuration <- input.configuration |> validate[['manual.config']]()
    
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
  it("then configuration is returned if configuration is valid Preset configuration",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    input.configuration[['dsn']] <- 'test'
    input.configuration[['uid']] <- 'test'
    input.configuration[['pwd']] <- 'test'

    expected.configuration <- input.configuration
    
    # Then
    actual.configuration <- expected.configuration |> validate[['Configuration']]() 
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then configuration is returned if configuration is valid Manual configuration",{
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
    
    # Then
    actual.configuration <- expected.configuration |> validate[['Configuration']]() 
    actual.configuration |> expect.equal(expected.configuration)
  })
})