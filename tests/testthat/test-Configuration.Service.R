describe("Configuration.Service",{
  it("Exist",{
    Configuration.Service |> expect.exist()
  })
})

describe("When services <- Configuration.Service()",{
  it("then services is a list",{
    # Given
    services <- Configuration.Service()
    
    # Then
    services |> expect.list()
  })
  it("then services contains OpenConfigFile service",{
    # Given
    services <- Configuration.Service()
    
    # Then
    services[["OpenConfigFile"]] |> expect.exist()
  })
})

describe("When service[['GetPresetConfig']]()",{
  it("then a list of parameters is returned",{
    # Given
    broker  <- Configuration.Broker()
    service <- broker |> Configuration.Service()
    
    # Then
    service[["GetPresetConfig"]]() |> expect.list()
  })
  it("then an exception if thrown if no DSN is found",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- NULL
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    broker  <- Configuration.Broker()
    broker[["GetPresetConfig"]] <- \() {
      configuration
    }

    service <- broker |> Configuration.Service()
    
    expected.error <- "Configuration has no DSN"
    
    # Then
    service[["GetPresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if no UID is found",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- NULL
    configuration[['pwd']] <- "PWD"

    broker  <- Configuration.Broker()
    broker[["GetPresetConfig"]] <- \() {
      configuration
    }
    
    service <- broker |> Configuration.Service()
    
    expected.error <- "Configuration has no UID"
    
    # Then
    service[["GetPresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if no PWD is found",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- NULL

    broker  <- Configuration.Broker()
    broker[["GetPresetConfig"]] <- \() {
      configuration
    }
    
    service <- broker |> Configuration.Service()
    
    expected.error <- "Configuration has no PWD"
    
    # Then
    service[["GetPresetConfig"]]() |> expect.error(expected.error)
  })
})