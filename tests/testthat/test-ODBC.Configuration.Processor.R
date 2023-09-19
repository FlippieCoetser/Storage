describe("ODBC.Configuration.Processor",{
  it("Exist",{
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
  it("then processes contains OpenConfigFile process",{
    # When
    processes <- ODBC.Configuration.Processor()

    # Then
    processes[['OpenConfigFile']] |> expect.function()
  })
  it("then processes contains GetConfiguration process",{
    # When
    processes <- ODBC.Configuration.Processor()

    # Then
    processes[['GetConfiguration']] |> expect.function()
  })
})

describe("When process[['OpenConfigFile']]()",{
  it("Then service[['OpenConfigFile']]() is called once",{
    # Given
    call.count <- 0

    service <- ODBC.Configuration.Broker() |> ODBC.Configuration.Service()
    service[['OpenConfigFile']] <- \() {
      call.count <<- call.count + 1
    }

    processor <- service |> ODBC.Configuration.Processor()

    before.call.count <- 0
    after.call.count  <- before.call.count + 1
    
    call.count |> expect.equal(before.call.count)

    # When
    processor[['OpenConfigFile']]()

    # Then
    call.count |> expect.equal(after.call.count)
  })
})