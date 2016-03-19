defmodule EchoServer.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      supervisor(Task.Supervisor, [[name: EchoServer.TaskSupervisor]]),
      worker(Task, [EchoServer.Echo, :accept, [1337]])
    ]

    opts = [strategy: :one_for_one]
    supervise(children, opts)
  end

end
