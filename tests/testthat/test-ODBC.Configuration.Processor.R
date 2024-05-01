describe('ODBC.Configuration.Processor',{
  it('Exist',{
    ODBC.Configuration.Processor |> expect.exist()
  })
})

describe("When processes <- ODBC.Configuration.Processor()",{
  it("then processes is a list",{
    # When
    processes <- ODBC.Configuration.Processor()

    # Then
    processes |> expect.list()
  })
  it("then processes contains open.config.file process",{
    # When
    processes <- ODBC.Configuration.Processor()

    # Then
    processes[['open.config.file']] |> expect.function()
  })
  it("then processes contains get.config process",{
    # When
    processes <- ODBC.Configuration.Processor()

    # Then
    processes[['get.config']] |> expect.function()
  })
})

describe("When process[['open.config.file']]()",{
  it("Then service[['open.config.file']]() is called once",{
    # Given
    call.count <- 0

    service <- ODBC.Configuration.Broker() |> ODBC.Configuration.Service()
    service[['open.config.file']] <- \() {
      call.count <<- call.count + 1
    }

    processor <- service |> ODBC.Configuration.Processor()

    before.call.count <- 0
    after.call.count  <- before.call.count + 1
    
    call.count |> expect.equal(before.call.count)

    # When
    processor[['open.config.file']]()

    # Then
    call.count |> expect.equal(after.call.count)
  })
})

describe("When type |> process[['get.config']]()",{
  it("then a preset configuration is returned if type is Preset",{
    skip_if_not(environment == 'local')
    # Given
    validate <- ODBC.Configuration.Validator()

    processor <- 
      ODBC.Configuration.Broker()  |> 
      ODBC.Configuration.Service() |> 
      ODBC.Configuration.Processor()

    type <- 'Preset'

    # When
    configuration <- type |> processor[['get.config']]()

    # Then
    configuration |> validate[['preset.config']]() |> expect.no.error()
  })
  it("then a manual configuration is returned if type is Manual",{
    skip_if_not(environment == 'local')
    # Given
    validate <- ODBC.Configuration.Validator()

    processor <- 
      ODBC.Configuration.Broker()  |> 
      ODBC.Configuration.Service() |> 
      ODBC.Configuration.Processor()

    type <- 'Manual'

    # When
    configuration <- type |> processor[['get.config']]()

    # Then
    configuration |> validate[['manual.config']]() |> expect.no.error()
  })
  it("then a preset configuration is returned if not type is provided",{
    skip_if_not(environment == 'local')
    # Given
    validate <- ODBC.Configuration.Validator()

    processor <- 
      ODBC.Configuration.Broker()  |> 
      ODBC.Configuration.Service() |> 
      ODBC.Configuration.Processor()

    # When
    configuration <- processor[['get.config']]()

    # Then
    configuration |> validate[['preset.config']]() |> expect.no.error()
  })
})
