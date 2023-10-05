describe('ODBC.Storage.Broker',{
  it('Exist',{
    ODBC.Storage.Broker |> expect.exist()
  })
})

describe("When operations <- configuration |> ODBC.Storage.Broker()",{
  it('then operations is a list',{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations |> expect.list()
  })
  it('then operations contains Create.Connection operation',{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Create.Connection']] |> expect.exist()
  })
  it('then operations contains Execute.Query operation',{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Execute.Query']] |> expect.exist()
  })
  it('then operations contains Get.Tables operation',{
    # When
    operations <- ODBC.Storage.Broker()

    # Then
    operations[['Get.Tables']] |> expect.exist()
  })
})

describe("when connection <- operate[['Create.Connection']]()",{
  it('then connection is not NA is valid configuration',{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    # When
    connection <- operate[['Create.Connection']]()

    # Then
    connection |> expect.not.na()
    connection |> DBI::dbDisconnect() 
  })
})

describe("when query |> operate[['Execute.Query']]()",{
  it('then no exception is thrown is query is valid',{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    query <- "SELECT 1"

    # Then
    query |> operate[['Execute.Query']]() |> expect.no.error()
  })
  it('then a data.frame is returned if query is valid',{
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
  it('then a data.frame containing tables names is returned',{
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
  it('then a data.frame is returned if table exist in storage',{
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
  it('then a data.frame is returned if table exist in storage',{
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
  it('then a data.frame is returned if table exist in storage',{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    existing.entities <- table |> operate[['Select']]()
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['Id']]

    # When
    actual.entity <- id |> operate[['SelectWhereId']](table) 
    
    # Then
    actual.entity |> expect.data.frame()
  })
})

describe("When id |> operate[['SelectWhereId']](table, fields)",{
  it('then a data.frame is returned if table exist in storage',{
    skip_if_not(environment == 'local')
    # Given
    operate <- configurator[["Get.Config"]]() |> ODBC.Storage.Broker()

    existing.entities <- table |> operate[['Select']]()
    existing.entity   <- existing.entities |> tail(1)

    id <- existing.entity[['Id']]

    # When
    actual.entity <- id |> operate[['SelectWhereId']](table, fields) 
    
    # Then
    actual.entity |> expect.data.frame()
  })
})