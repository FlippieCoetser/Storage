describe('Storage.Orchestrator',{
  it('Exist',{
    Storage.Orchestrator |> expect.exist()
  })
})

describe("When orchestrations <- Storage.Orchestrator()",{
  it("then orchestrations is a list",{
    # When
    orchestrations <- Storage.Orchestrator()

    # Then
    orchestrations |> expect.list()
  })
  it("then orchestrations contains ExecuteQuery orchestration",{
    # When
    orchestrations <- Storage.Orchestrator()

    # Then
    orchestrations[['ExecuteQuery']] |> expect.exist()
  })
  it("then orchestrations contains Insert orchestration",{
    # When
    orchestrations <- Storage.Orchestrator()

    # Then
    orchestrations[['Insert']] |> expect.exist()
  })
  it("then orchestrations contains Select orchestration",{
    # When
    orchestrations <- Storage.Orchestrator()

    # Then
    orchestrations[['Select']] |> expect.exist()
  })
})

describe("when query |> orchestrate[['ExecuteQuery']]()",{
  it("then an exception is thrown if orchestration service instantiated with type equal mock",{
    # Given
    type <- 'Mock'
    orchestrate <- configuration |> Storage.Orchestrator(type)

    expected.error <- "Mock Storage Provider has no ExecuteQuery implementation."

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['ExecuteQuery']]() |> expect.error(expected.error)
  })
  it("then no exception if thrown if orchestration service instantiated with type equal ODBC",{
    # Given
    type <- 'ODBC'
    orchestrate <- configuration |> Storage.Orchestrator(type)

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['ExecuteQuery']]() |> expect.no.error()
  })
  it("then an exception is thrown if orchestration service instantiated with no type provided",{
    # Given
    orchestrate <- configuration |> Storage.Orchestrator()

    expected.error <- "Mock Storage Provider has no ExecuteQuery implementation."

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['ExecuteQuery']]() |> expect.error(expected.error)
  })
})