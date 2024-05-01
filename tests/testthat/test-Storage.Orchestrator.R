describe('Storage.Orchestrator',{
  it('Exist',{
    Storage.Orchestrator |> expect.exist()
  })
})

describe("When orchestrations <- configuration |> Storage.Orchestrator()",{
  it("then orchestrations is a list",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations |> expect.list()
  })
  it("then orchestrations contains 'seed.table' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['seed.table']] |> expect.exist()
  })
  it("then orchestrations contains 'execute.query' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['execute.query']] |> expect.exist()
  })
  it("then orchestrations contains 'add' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['add']] |> expect.exist()
  })
  it("then orchestrations contains 'retrieve' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['retrieve']] |> expect.exist()
  })
  it("then orchestrations contains 'retrieve.where.id' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['retrieve.where.id']] |> expect.exist()
  })
  it("then orchestrations contains 'modify' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['modify']] |> expect.exist()
  })
  it("then orchestrations contains 'remove' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['remove']] |> expect.exist()
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

describe("when query |> orchestrate[['execute.query']]()",{
  it("then an exception is thrown if orchestration service instantiated with type equal memory",{
    # Given
    type <- 'memory'
    orchestrate <- configuration |> Storage.Orchestrator(type)

    expected.error <- 'Memory.Storage: not.implemented.'

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['execute.query']]() |> expect.error(expected.error)
  })
  it("then no exception if thrown if orchestration service instantiated with type equal ODBC",{
    skip_if_not(environment == 'local')
    # Given
    type <- 'odbc'
    orchestrate <- configurator[["get.config"]]() |> Storage.Orchestrator(type)

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['execute.query']]() |> expect.no.error()
  })
  it("then no exception is thrown if orchestration service instantiated with no type provided",{
    skip_if_not(environment == 'local')
    # Given
    orchestrate <- configurator[["get.config"]]() |> Storage.Orchestrator()

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['execute.query']]() |> expect.no.error()
  })
})