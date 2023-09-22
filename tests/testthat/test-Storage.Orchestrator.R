describe('Storage.Orchestrator',{
  it('Exist',{
    Storage.Orchestrator |> expect.exist()
  })
})

describe("When orchestrations <- configuration |> Storage.Orchestrator()",{
  it("then orchestrations is a list",{
    # When
    orchestrations <- configuration |> Storage.Orchestrator()

    # Then
    orchestrations |> expect.list()
  })
  it("then orchestrations contains ExecuteQuery orchestration",{
    # When
    orchestrations <- configuration |> Storage.Orchestrator()

    # Then
    orchestrations[['ExecuteQuery']] |> expect.exist()
  })
  it("then orchestrations contains Insert orchestration",{
    # When
    orchestrations <- configuration |> Storage.Orchestrator()

    # Then
    orchestrations[['Insert']] |> expect.exist()
  })
  it("then orchestrations contains Select orchestration",{
    # When
    orchestrations <- configuration |> Storage.Orchestrator()

    # Then
    orchestrations[['Select']] |> expect.exist()
  })
  it("then orchestrations contains SelectWhereId orchestration",{
    # When
    orchestrations <- configuration |> Storage.Orchestrator()

    # Then
    orchestrations[['SelectWhereId']] |> expect.exist()
  })
  it("then orchestrations contains Update orchestration",{
    # When
    orchestrations <- configuration |> Storage.Orchestrator()

    # Then
    orchestrations[['Update']] |> expect.exist()
  })
  it("then orchestrations contains Delete orchestration",{
    # When
    orchestrations <- configuration |> Storage.Orchestrator()

    # Then
    orchestrations[['Delete']] |> expect.exist()
  })
})

describe("When configuration |> Storage.Orchestration()",{
  it("then an exception is thrown if configuration is invalid",{
    # Given
    configuration <- list()
    expected.error <- "Invalid ODBC configuration. Provide valid Preset or Manual configuration."

    # When
    configuration |> Storage.Orchestrator() |> expect.error(expected.error)
  })
})

describe("when query |> orchestrate[['ExecuteQuery']]()",{
  it("then an exception is thrown if orchestration service instantiated with type equal memory",{
    # Given
    type <- 'memory'
    orchestrate <- configuration |> Storage.Orchestrator(type)

    expected.error <- "Memory Storage Provider has no ExecuteQuery implementation."

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['ExecuteQuery']]() |> expect.error(expected.error)
  })
  it("then no exception if thrown if orchestration service instantiated with type equal ODBC",{
    skip_if_not(environment == 'local')
    # Given
    type <- 'odbc'
    orchestrate <- configuration |> Storage.Orchestrator(type)

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['ExecuteQuery']]() |> expect.no.error()
  })
  it("then no exception is thrown if orchestration service instantiated with no type provided",{
    skip_if_not(environment == 'local')
    # Given
    orchestrate <- configuration |> Storage.Orchestrator()

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['ExecuteQuery']]() |> expect.no.error()
  })
})