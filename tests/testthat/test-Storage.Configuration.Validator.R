describe("Storage.Configuration.Validator",{
  it("Exist",{
    Storage.Configuration.Validator |> expect.exist()
  })
})

describe("When validations <- Storage.Configuration.Validator()",{
  it("then validations is a list",{
    # Given
    validations <- Storage.Configuration.Validator()
    
    # Then
    validations |> expect.list()
  })
  it("then validations contains IsNull validator",{
    # Given
    validations <- Storage.Configuration.Validator()
    
    # Then
    validations[["IsNull"]] |> expect.exist()
  })
  it("then validations contains IsEmpty validator",{
    # Given
    validations <- Storage.Configuration.Validator()
        
    # Then
    validations[["IsEmpty"]] |> expect.exist()
  })
  it("then validations contains HasDSN validator",{
    # Given
    validations <- Storage.Configuration.Validator()
            
    # Then
    validations[["HasDSN"]] |> expect.exist()
  })
  it("then validations contains HasDRIVER validator",{
    # Given
    validations <- Storage.Configuration.Validator()
    
    # Then
    validations[["HasDRIVER"]] |> expect.exist()
  })
  it("then validations contains HasSERVER validator",{
    # Given
    validations <- Storage.Configuration.Validator()
    
    # Then
    validations[["HasSERVER"]] |> expect.exist()
  })
  it("then validations contains HasDATABASE validator",{
    # Given
    validations <- Storage.Configuration.Validator()
    
    # Then
    validations[["HasDATABASE"]] |> expect.exist()
  })
  it("then validations contains HasUID validator",{
    # Given
    validations <- Storage.Configuration.Validator()
       
    # Then
    validations[["HasUID"]] |> expect.exist()
  })
  it("then validations contains HasPWD validator",{
    # Given
    validations <- Storage.Configuration.Validator()
       
    # Then
    validations[["HasPWD"]] |> expect.exist()
  })
  it("then validations contains PresetConfig validator",{
    # Given
    validations <- Storage.Configuration.Validator()
       
    # Then
    validations[["PresetConfig"]] |> expect.exist()
  })
})

describe("When value |> validate[['IsNull']]()",{
  it("then true is returned if value is null",{
    # Given
    validate <- Storage.Configuration.Validator()
    
    # When
    value <- NULL
    
    # Then
    value |> validate[["IsNull"]]() |> expect.true()
  })
  it("then false is returned if value is not null",{
    # Given
    validate <- Storage.Configuration.Validator()
    
    # When
    value <- "value"
    
    # Then
    value |> validate[["IsNull"]]() |> expect.false()
  })
})

describe("When value |> validate[['IsEmpty']]()",{
  it("then true is returned if value is empty",{
    # Given
    validate <- Storage.Configuration.Validator()
    
    # When
    value <- ""
    
    # Then
    value |> validate[["IsEmpty"]]() |> expect.true()
  })
  it("then false is returned if value is not empty",{
    # Given
    validate <- Storage.Configuration.Validator()
    
    # When
    value <- "value"
    
    # Then
    value |> validate[["IsEmpty"]]() |> expect.false()
  })
})

describe("When configuration |> validate[['HasDSN']]()",{
  it("then configuration is returned if configuration has dsn",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['dsn']] <- "DSN"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasDSN"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has dsn",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['dsn']] <- "DSN"

    # Then
    configuration |> validate[["HasDSN"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no dsn",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no dsn"

    # Then
    configuration |> validate[["HasDSN"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['HasDRIVER']]()",{
  it("then configuration is returned if configuration has driver",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['driver']] <- "DRIVER"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasDRIVER"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has driver",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['driver']] <- "DRIVER"

    # Then
    configuration |> validate[["HasDRIVER"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no driver",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no driver."

    # Then
    configuration |> validate[["HasDRIVER"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['HasSERVER']]()",{
  it("then configuration is returned if configuration has server",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['server']] <- "SERVER"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasSERVER"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has server",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['server']] <- "SERVER"

    # Then
    configuration |> validate[["HasSERVER"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no server",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no server."

    # Then
    configuration |> validate[["HasSERVER"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['HasDATABASE']]()",{
  it("then configuration is returned if configuration has database",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['database']] <- "database"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasDATABASE"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has database",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['database']] <- "database"

    # Then
    configuration |> validate[["HasDATABASE"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no database",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no database."

    # Then
    configuration |> validate[["HasDATABASE"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['HasUID']]()",{
  it("then configuration is returned if configuration has uid",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['uid']] <- "UID"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasUID"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has uid",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['uid']] <- "UID"

    # Then
    configuration |> validate[["HasUID"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no uid",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no uid"

    # Then
    configuration |> validate[["HasUID"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['HasPWD']]()",{
  it("then configuration is returned if configuration has pwd",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['pwd']] <- "PWD"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasPWD"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has pwd",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['pwd']] <- "PWD"

    # Then
    configuration |> validate[["HasPWD"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no pwd",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no pwd"

    # Then
    configuration |> validate[["HasPWD"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['PresetConfig']]()",{
  it("then configuration is returned if configuration is valid",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["PresetConfig"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration is valid",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no dsn",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['uid']] <- "UID"
    configuration[['pwd']] <- "PWD"

    expected.error <- "Configuration has no dsn"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has no uid",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['pwd']] <- "PWD"

    expected.error <- "Configuration has no uid"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has no pwd",{
    # Given
    validate <- Storage.Configuration.Validator()

    configuration <- list()
    configuration[['dsn']] <- "DSN"
    configuration[['uid']] <- "UID"

    expected.error <- "Configuration has no pwd"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.error(expected.error)
  })
})