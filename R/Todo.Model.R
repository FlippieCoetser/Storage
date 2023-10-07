Todo.Model <- \(task) data.frame(
  Id = uuid::UUIDgenerate(),
  Task = task,
  Status = 'New'
)