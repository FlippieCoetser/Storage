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
  it("then processes contains Open.Config.File process",{
    # When
    processes <- ODBC.Configuration.Processor()

    # Then
    processes[['Open.Config.File']] |> expect.function()
  })
  it("then processes contains Get.Config process",{
    # When
    processes <- ODBC.Configuration.Processor()

    # Then
    processes[['Get.Config']] |> expect.function()
  })
})

describe("When process[['Open.Config.File']]()",{
  it("Then service[['Open.Config.File']]() is called once",{
    # Given
    call.count <- 0

    service <- ODBC.Configuration.Broker() |> ODBC.Configuration.Service()
    service[['Open.Config.File']] <- \() {
      call.count <<- call.count + 1
    }

    processor <- service |> ODBC.Configuration.Processor()

    before.call.count <- 0
    after.call.count  <- before.call.count + 1
    
    call.count |> expect.equal(before.call.count)

    # When
    processor[['Open.Config.File']]()

    # Then
    call.count |> expect.equal(after.call.count)
  })
})

describe("When type |> process[['Get.Config']]()",{
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
    configuration <- type |> processor[['Get.Config']]()

    # Then
    configuration |> validate[['Preset.Config']]() |> expect.no.error()
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
    configuration <- type |> processor[['Get.Config']]()

    # Then
    configuration |> validate[['Get.Manual.Config']]() |> expect.no.error()
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
    configuration <- processor[['Get.Config']]()

    # Then
    configuration |> validate[['Preset.Config']]() |> expect.no.error()
  })
})
