describe('Memory.Storage.Logic.Validator',{
  it('Exist',{
    Memory.Storage.Logic.Validator |> expect.exist()
  })
})

describe('When validators <- Memory.Storage.Logic.Validator()',{
  it('then validators is a list',{
    # When
    validators <- Memory.Storage.Logic.Validator()

    # Then
    validators |> expect.list()
  })
  it('then validators contains Is.Existing.Table validator',{
    # When
    validators <- Memory.Storage.Logic.Validator()

    # Then
    validators[['Is.Existing.Table']] |> expect.exist()
  })
})