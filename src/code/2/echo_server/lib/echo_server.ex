defmodule EchoServer do
  use Application

  def start(_, _) do
    EchoServer.Supervisor.start_link
  end

end
