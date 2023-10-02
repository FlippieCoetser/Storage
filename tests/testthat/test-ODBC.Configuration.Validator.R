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
  it('then validators contains Preset.Config validator',{
   # When
   validators <- ODBC.Configuration.Validator()
   
   # Then
   validators[['Preset.Config']] |> expect.exist()
  })
  it('then validators contains Get.Manual.Config validator',{
   # When
   validators <- ODBC.Configuration.Validator()
   
   # Then
   validators[['Get.Manual.Config']] |> expect.exist()
  })
  it("then validators contains Has.Drv validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Has.Drv']] |> expect.exist()
  })
  it("then validators contains Has.Dsn validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Has.Dsn']] |> expect.exist()
  })
  it("then validators contains Has.Driver validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Has.Driver']] |> expect.exist()
  })
  it("then validators contains Has.Server validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Has.Server']] |> expect.exist()
  })
  it("then validators contains Has.Database validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Has.Database']] |> expect.exist()
  })
  it("then validators contains Has.Uid validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Has.Uid']] |> expect.exist()
  })
  it("then validators contains Has.Pwd validator",{
    # When
    validators <- ODBC.Configuration.Validator()

    # Then
    validators[['Has.Pwd']] |> expect.exist()
  })
})

describe("When configuration |> validate[['Has.Drv']]()",{
  it("then no exception is thrown if drv is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'  
    
    # Then
    input.configuration |> validate[['Has.Drv']]() |> expect.no.error()
  })
  it("then an exception is thrown if drv is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "drv is NULL. Valid configuration requires a drv."
    
    # When
    input.configuration <- list()
    input.configuration[['drv']] <- NULL 
    
    # Then
    input.configuration |> validate[['Has.Drv']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has drv",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['drv']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['Has.Drv']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Has.Dsn']]()",{
  it("then no exception is thrown if dsn is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['dsn']] <- 'test'  
    
    # Then
    input.configuration |> validate[['Has.Dsn']]() |> expect.no.error()
  })
  it("then an exception is thrown if dsn is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "dsn is NULL. Valid configuration requires a dsn."
    
    # When
    input.configuration <- list()
    input.configuration[['dsn']] <- NULL 
    
    # Then
    input.configuration |> validate[['Has.Dsn']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has dsn",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['dsn']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['Has.Dsn']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Has.Driver']]()",{
  it("then no exception is thrown if driver is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['driver']] <- 'test'  
    
    # Then
    input.configuration |> validate[['Has.Driver']]() |> expect.no.error()
  })
  it("then an exception is thrown if driver is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "driver is NULL. Valid configuration requires a driver."
    
    # When
    input.configuration <- list()
    input.configuration[['driver']] <- NULL 
    
    # Then
    input.configuration |> validate[['Has.Driver']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has driver",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['driver']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['Has.Driver']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Has.Server']]()",{
  it("then no exception is thrown if server is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['server']] <- 'test'  
    
    # Then
    input.configuration |> validate[['Has.Server']]() |> expect.no.error()
  })
  it("then an exception is thrown if server is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "server is NULL. Valid configuration requires a server."
    
    # When
    input.configuration <- list()
    input.configuration[['server']] <- NULL 
    
    # Then
    input.configuration |> validate[['Has.Server']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has server",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['server']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['Has.Server']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Has.Database']]()",{
  it("then no exception is thrown if database is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['database']] <- 'test'  
    
    # Then
    input.configuration |> validate[['Has.Database']]() |> expect.no.error()
  })
  it("then an exception is thrown if database is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "database is NULL. Valid configuration requires a database."
    
    # When
    input.configuration <- list()
    input.configuration[['database']] <- NULL 
    
    # Then
    input.configuration |> validate[['Has.Database']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has database",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['database']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['Has.Database']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Has.Uid']]()",{
  it("then no exception is thrown if uid is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['uid']] <- 'test'  
    
    # Then
    input.configuration |> validate[['Has.Uid']]() |> expect.no.error()
  })
  it("then an exception is thrown if uid is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "uid is NULL. Valid configuration requires a uid."
    
    # When
    input.configuration <- list()
    input.configuration[['uid']] <- NULL 
    
    # Then
    input.configuration |> validate[['Has.Uid']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has uid",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['uid']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['Has.Uid']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Has.Pwd']]()",{
  it("then no exception is thrown if pwd is not NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    # When
    input.configuration <- list()
    input.configuration[['pwd']] <- 'test'  
    
    # Then
    input.configuration |> validate[['Has.Pwd']]() |> expect.no.error()
  })
  it("then an exception is thrown if pwd is NULL",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    expected.error <- "pwd is NULL. Valid configuration requires a pwd."
    
    # When
    input.configuration <- list()
    input.configuration[['pwd']] <- NULL 
    
    # Then
    input.configuration |> validate[['Has.Pwd']]() |> expect.error(expected.error)
  })
  it("then configuration is returned if configuration has pwd",{
    # Given
    validate <- ODBC.Configuration.Validator()
    
    input.configuration <- list()
    input.configuration[['pwd']] <- 'test'
    
    expected.configuration <- input.configuration
    
    # When
    actual.configuration <- input.configuration |> validate[['Has.Pwd']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Preset.Config']]()",{
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
    input.configuration |> validate[['Preset.Config']]() |> expect.no.error()
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
    input.configuration |> validate[['Preset.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Preset.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Preset.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Preset.Config']]() |> expect.error(expected.error)
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
    actual.configuration <- input.configuration |> validate[['Preset.Config']]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
})

describe("When configuration |> validate[['Get.Manual.Config']]()",{
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
    input.configuration |> validate[['Get.Manual.Config']]() |> expect.no.error()
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
    input.configuration |> validate[['Get.Manual.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Get.Manual.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Get.Manual.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Get.Manual.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Get.Manual.Config']]() |> expect.error(expected.error)
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
    input.configuration |> validate[['Get.Manual.Config']]() |> expect.error(expected.error)
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
    actual.configuration <- input.configuration |> validate[['Get.Manual.Config']]()
    
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