describe("Configuration.Exceptions", {
  it("Exist", {
    Configuration.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Configuration.Exceptions()", {
  it("then exceptions is a list", {
    # Given
    exceptions <- Configuration.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exceptions contains DSNIsNull", {
    # Given
    exceptions <- Configuration.Exceptions()

    # Then
    exceptions[["DSNIsNull"]] |> expect.exist()
  })
  it("then exceptions contains UIDIsNull", {
    # Given
    exceptions <- Configuration.Exceptions()

    # Then
    exceptions[["UIDIsNull"]] |> expect.exist()
  })
  it("then exceptions contains PWDIsNull", {
    # Given
    exceptions <- Configuration.Exceptions()

    # Then
    exceptions[["PWDIsNull"]] |> expect.exist()
  })
})

describe("When input |> exception[['DSNIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["DSNIsNull"]]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- Configuration.Exceptions()

    expected.error <- "Configuration has no dsn"

    # When
    input <- TRUE

    # Then
    input |> exception[["DSNIsNull"]]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['UIDIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["UIDIsNull"]]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- Configuration.Exceptions()

    expected.error <- 'Configuration has no uid'

    # When
    input <- TRUE

    # Then
    input |> exception[["UIDIsNull"]]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['PWDIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[["PWDIsNull"]]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- Configuration.Exceptions()

    expected.error <- 'Configuration has no pwd'

    # When
    input <- TRUE

    # Then
    input |> exception[["PWDIsNull"]]() |> expect.error(expected.error)
  })
})