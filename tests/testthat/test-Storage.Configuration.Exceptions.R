describe("Storage.Configuration.Exceptions", {
  it("Exist", {
    Storage.Configuration.Exceptions |> expect.exist()
  })
})

describe("When exceptions <- Storage.Configuration.Exceptions()", {
  it("then exceptions is a list", {
    # Given
    exceptions <- Storage.Configuration.Exceptions()

    # Then
    exceptions |> expect.list()
  })
  it("then exceptions contains dsnIsNull", {
    # Given
    exceptions <- Storage.Configuration.Exceptions()

    # Then
    exceptions[['dsnIsNull']] |> expect.exist()
  })
  it("then exceptions contains driverIsNull",{
    # Given
    exceptions <- Storage.Configuration.Exceptions()

    # Then
    exceptions[['driverIsNull']] |> expect.exist()
  })
  it("then exceptions contains serverIsNull", {
    # Given
    exceptions <- Storage.Configuration.Exceptions()

    # Then
    exceptions[['serverIsNull']] |> expect.exist()
  })
  it("then exceptions contains uidIsNull", {
    # Given
    exceptions <- Storage.Configuration.Exceptions()

    # Then
    exceptions[['uidIsNull']] |> expect.exist()
  })
  it("then exceptions contains pwdIsNull", {
    # Given
    exceptions <- Storage.Configuration.Exceptions()

    # Then
    exceptions[['pwdIsNull']] |> expect.exist()
  })
})

describe("When input |> exception[['dsnIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Storage.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['dsnIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- Storage.Configuration.Exceptions()

    expected.error <- "Configuration has no dsn"

    # When
    input <- TRUE

    # Then
    input |> exception[['dsnIsNull']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['driverIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Storage.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['driverIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- Storage.Configuration.Exceptions()

    expected.error <- "Configuration has no driver."

    # When
    input <- TRUE

    # Then
    input |> exception[['driverIsNull']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['uidIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Storage.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['uidIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- Storage.Configuration.Exceptions()

    expected.error <- 'Configuration has no uid'

    # When
    input <- TRUE

    # Then
    input |> exception[['uidIsNull']]() |> expect.error(expected.error)
  })
})

describe("When input |> exception[['pwdIsNull']]()", {
  it("then no exception is thrown if input is FALSE", {
    # Given
    exception <- Storage.Configuration.Exceptions()

    # When
    input <- FALSE

    # Then
    input |> exception[['pwdIsNull']]() |> expect.no.error()
  })
  it("then an exception is thrown if input is TRUE",{
    # Given
    exception <- Storage.Configuration.Exceptions()

    expected.error <- 'Configuration has no pwd'

    # When
    input <- TRUE

    # Then
    input |> exception[['pwdIsNull']]() |> expect.error(expected.error)
  })
})