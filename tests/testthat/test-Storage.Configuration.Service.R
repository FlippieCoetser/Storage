describe("Storage.Configuration.Service",{
  it("Exist",{
    Storage.Configuration.Service |> expect.exist()
  })
})

describe("When services <- Storage.Configuration.Service()",{
  it("then services is a list",{
    # Given
    services <- Storage.Configuration.Service()
    
    # Then
    services |> expect.list()
  })
  it("then services contains OpenConfigFile service",{
    # Given
    services <- Storage.Configuration.Service()
    
    # Then
    services[["OpenConfigFile"]] |> expect.exist()
  })
  it("then services contains GetPresetConfig service",{
    # Given
    services <- Storage.Configuration.Service()
    
    # Then
    services[["GetPresetConfig"]] |> expect.exist()
  })
  it("then services contains GetManualConfig service",{
    # Given
    services <- Storage.Configuration.Service()
    
    # Then
    services[["GetManualConfig"]] |> expect.exist()
  })
})

describe("When service[['GetPresetConfig']]()",{
  it("then a list of parameters is returned",{
    # Given
    broker  <- Storage.Configuration.Broker()
    service <- broker |> Storage.Configuration.Service()
    
    # Then
    service[["GetPresetConfig"]]() |> expect.list()
  })
  it("then an exception if thrown if no dsn is found",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- NULL
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    broker  <- Storage.Configuration.Broker()
    broker[["GetPresetConfig"]] <- \() {
      configuration
    }

    service <- broker |> Storage.Configuration.Service()
    
    expected.error <- "Configuration has no dsn"
    
    # Then
    service[["GetPresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if no uid is found",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- NULL
    configuration[['pwd']] <- "PWD"

    broker  <- Storage.Configuration.Broker()
    broker[["GetPresetConfig"]] <- \() {
      configuration
    }
    
    service <- broker |> Storage.Configuration.Service()
    
    expected.error <- "Configuration has no uid"
    
    # Then
    service[["GetPresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception if thrown if no pwd is found",{
    # Given
    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- NULL

    broker  <- Storage.Configuration.Broker()
    broker[["GetPresetConfig"]] <- \() {
      configuration
    }
    
    service <- broker |> Storage.Configuration.Service()
    
    expected.error <- "Configuration has no pwd"
    
    # Then
    service[["GetPresetConfig"]]() |> expect.error(expected.error)
  })
})

describe("When service[['GetManualConfig']]()",{
  it("then a list of configuration parameters is returned",{
    # Given
    broker  <- Storage.Configuration.Broker()
    service <- broker |> Storage.Configuration.Service()
    
    # Then
    service[["GetManualConfig"]]() |> expect.list()
  })
})