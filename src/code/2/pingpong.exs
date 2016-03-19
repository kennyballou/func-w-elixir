defmodule PingPong do
  def start_link do
    {:ok, spawn_link(fn -> loop() end)}
  end

  defp loop do
    receive do
      {:ping, sender} ->
        IO.puts "[PingPong]: Received Ping"
        IO.puts "[PingPong]: Sending Pong..."
        send sender, {:pong, self}
    end
    loop
  end
end

{:ok, pid} = PingPong.start_link
IO.puts "Sending Ping..."
send pid, {:ping, self}

receive do
  {:pong, ^pid} ->
    IO.puts "Received Pong"
  after 5000 ->
    IO.puts "Never Received Pong"
end
