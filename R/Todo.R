Todo <- \(task) data.frame(
  id = uuid::UUIDgenerate(),
  task = task,
  status = 'New'
)