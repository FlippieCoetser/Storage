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
})