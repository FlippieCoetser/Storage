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
})