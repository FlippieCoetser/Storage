describe('Storage.Orchestrator',{
  it('Exist',{
    Storage.Orchestrator |> expect.exist()
  })
})

describe("When orchestrations <- configuration |> Storage.Orchestrator()",{
  it("then orchestrations is a list",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations |> expect.list()
  })
  it("then orchestrations contains 'Seed.Table' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['Seed.Table']] |> expect.exist()
  })
  it("then orchestrations contains 'Execute.Query' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['Execute.Query']] |> expect.exist()
  })
  it("then orchestrations contains 'Add' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['Add']] |> expect.exist()
  })
  it("then orchestrations contains 'Retrieve' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['Retrieve']] |> expect.exist()
  })
  it("then orchestrations contains 'RetrieveWhereId' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['RetrieveWhereId']] |> expect.exist()
  })
  it("then orchestrations contains 'Modify' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['Modify']] |> expect.exist()
  })
  it("then orchestrations contains 'Remove' orchestration",{
    skip_if_not(environment == 'local')
    # When
    orchestrations <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # Then
    orchestrations[['Remove']] |> expect.exist()
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

describe("when query |> orchestrate[['Execute.Query']]()",{
  it("then an exception is thrown if orchestration service instantiated with type equal memory",{
    # Given
    type <- 'memory'
    orchestrate <- configuration |> Storage.Orchestrator(type)

    expected.error <- 'Memory.Storage: Not.Implemented.'

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['Execute.Query']]() |> expect.error(expected.error)
  })
  it("then no exception if thrown if orchestration service instantiated with type equal ODBC",{
    skip_if_not(environment == 'local')
    # Given
    type <- 'odbc'
    orchestrate <- configurator[["Get.Config"]]() |> Storage.Orchestrator(type)

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['Execute.Query']]() |> expect.no.error()
  })
  it("then no exception is thrown if orchestration service instantiated with no type provided",{
    skip_if_not(environment == 'local')
    # Given
    orchestrate <- configurator[["Get.Config"]]() |> Storage.Orchestrator()

    # When
    query <- "SELECT 1"

    # Then
    query |> orchestrate[['Execute.Query']]() |> expect.no.error()
  })
})