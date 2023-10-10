describe('ODBC.Storage.Broker',{
  it('Exist',{
    ODBC.Storage.Broker |> expect.exist()
  })
})

describe("When operations <- configuration |> ODBC.Storage.Broker()",{
  it("then operations is a list",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations |> expect.list()
  })
  it("then operations contains 'Execute.Query' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Execute.Query']] |> expect.exist()
  })
  it("then operations contains 'Get.Tables' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Get.Tables']] |> expect.exist()
  })
  it("then operations contains 'Insert' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Insert']] |> expect.exist()
  })
  it("then operations contains 'Select' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Select']] |> expect.exist()
  })
  it("then operations contains 'SelectWhereId' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['SelectWhereId']] |> expect.exist()
  })
  it("then operations contains 'Update' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Update']] |> expect.exist()
  })
  it("then operations contains 'Delete' operation",{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Delete']] |> expect.exist()
  })
})

describe("when query |> operate[['Execute.Query']]()",{
  it("then no exception is thrown is query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # Then
    query |> operate[['Execute.Query']]() |> expect.no.error()
  })
  it("then a data.frame is returned if query is valid",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # When
    output <- query |> operate[['Execute.Query']]() 

    # Then
    output |> expect.data.frame()
  })
})

describe("when operate[['Get.Tables']]()",{
  it("then a data.frame containing tables names is returned",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    # When
    tables <- operate[['Get.Tables']]() 

    # Then
    tables |> expect.data.frame()
  })
})

describe("When table |> operate[['Select']]()",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    # When
    entities <- table |> operate[['Select']]() 
    
    # Then
    entities |> expect.data.frame()
  })
})

describe("When table |> operate[['Select']](fields)",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    # When
    entities <- table |> operate[['Select']](fields) 
    
    # Then
    entities |> expect.data.frame()
  })
})

describe("When id |> operate[['SelectWhereId']](table)",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    existing.entities <- table |> operate[['Select']]()
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['id']]

    # When
    actual.entity <- id |> operate[['SelectWhereId']](table) 
    
    # Then
    actual.entity |> expect.data.frame()
  })
})

describe("When id |> operate[['SelectWhereId']](table, fields)",{
  it("then a data.frame is returned if table exist in storage",{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    existing.entities <- table |> operate[['Select']]()
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['id']]

    # When
    actual.entity <- id |> operate[['SelectWhereId']](table, fields) 
    
    # Then
    actual.entity |> expect.data.frame()
  })
})