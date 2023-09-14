describe("Configuration.Validator",{
  it("Exist",{
    Configuration.Validator |> expect.exist()
  })
})

describe("When validations <- Configuration.Validator()",{
  it("then validations is a list",{
    # Given
    validations <- Configuration.Validator()
    
    # Then
    validations |> expect.list()
  })
  it("then validations contains IsNull validator",{
    # Given
    validations <- Configuration.Validator()
    
    # Then
    validations[["IsNull"]] |> expect.exist()
  })
  it("then validations contains IsEmpty validator",{
    # Given
    validations <- Configuration.Validator()
        
    # Then
    validations[["IsEmpty"]] |> expect.exist()
  })
  it("then validations contains HasDSN validator",{
    # Given
    validations <- Configuration.Validator()
            
    # Then
    validations[["HasDSN"]] |> expect.exist()
  })
  it("then validations contains HasUID validator",{
    # Given
    validations <- Configuration.Validator()
       
    # Then
    validations[["HasUID"]] |> expect.exist()
  })
  it("then validations contains HasPWD validator",{
    # Given
    validations <- Configuration.Validator()
       
    # Then
    validations[["HasPWD"]] |> expect.exist()
  })
  it("then validations contains PresetConfig validator",{
    # Given
    validations <- Configuration.Validator()
       
    # Then
    validations[["PresetConfig"]] |> expect.exist()
  })
})

describe("When value |> validate[['IsNull']]()",{
  it("then true is returned if value is null",{
    # Given
    validate <- Configuration.Validator()
    
    # When
    value <- NULL
    
    # Then
    value |> validate[["IsNull"]]() |> expect.true()
  })
  it("then false is returned if value is not null",{
    # Given
    validate <- Configuration.Validator()
    
    # When
    value <- "value"
    
    # Then
    value |> validate[["IsNull"]]() |> expect.false()
  })
})

describe("When value |> validate[['IsEmpty']]()",{
  it("then true is returned if value is empty",{
    # Given
    validate <- Configuration.Validator()
    
    # When
    value <- ""
    
    # Then
    value |> validate[["IsEmpty"]]() |> expect.true()
  })
  it("then false is returned if value is not empty",{
    # Given
    validate <- Configuration.Validator()
    
    # When
    value <- "value"
    
    # Then
    value |> validate[["IsEmpty"]]() |> expect.false()
  })
})

describe("When configuration |> validate[['HasDSN']]()",{
  it("then configuration is returned if configuration has DSN",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["DSN"]] <- "DSN"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasDSN"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has DSN",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["DSN"]] <- "DSN"

    # Then
    configuration |> validate[["HasDSN"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no DSN",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no DSN"

    # Then
    configuration |> validate[["HasDSN"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['HasUID']]()",{
  it("then configuration is returned if configuration has UID",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["UID"]] <- "UID"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasUID"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has UID",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["UID"]] <- "UID"

    # Then
    configuration |> validate[["HasUID"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no UID",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no UID"

    # Then
    configuration |> validate[["HasUID"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['HasPWD']]()",{
  it("then configuration is returned if configuration has PWD",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["PWD"]] <- "PWD"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["HasPWD"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration has PWD",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["PWD"]] <- "PWD"

    # Then
    configuration |> validate[["HasPWD"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no PWD",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()

    expected.error <- "Configuration has no PWD"

    # Then
    configuration |> validate[["HasPWD"]]() |> expect.error(expected.error)
  })
})

describe("When configuration |> validate[['PresetConfig']]()",{
  it("then configuration is returned if configuration is valid",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["DSN"]] <- "DSN"
    configuration[["UID"]] <- "UID"
    configuration[["PWD"]] <- "PWD"

    expected.configuration <- configuration
    
    # When
    actual.configuration <- configuration |> validate[["PresetConfig"]]()
    
    # Then
    actual.configuration |> expect.equal(expected.configuration)
  })
  it("then no exception is thrown if configuration is valid",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["DSN"]] <- "DSN"
    configuration[["UID"]] <- "UID"
    configuration[["PWD"]] <- "PWD"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.no.error()
  })
  it("then an exception is thrown if configuration has no DSN",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["UID"]] <- "UID"
    configuration[["PWD"]] <- "PWD"

    expected.error <- "Configuration has no DSN"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has no UID",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["DSN"]] <- "DSN"
    configuration[["PWD"]] <- "PWD"

    expected.error <- "Configuration has no UID"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.error(expected.error)
  })
  it("then an exception is thrown if configuration has no PWD",{
    # Given
    validate <- Configuration.Validator()

    configuration <- list()
    configuration[["DSN"]] <- "DSN"
    configuration[["UID"]] <- "UID"

    expected.error <- "Configuration has no PWD"

    # Then
    configuration |> validate[["PresetConfig"]]() |> expect.error(expected.error)
  })
})