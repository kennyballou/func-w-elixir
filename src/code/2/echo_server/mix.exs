defmodule EchoServer.Mixfile do
  use Mix.Project

  def project do
    [app: :echo_server,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [mod: {EchoServer, []},
     applications: [:logger]]
  end

  defp deps do
    []
  end
end
