defmodule Fib do
  def seq(0), do: 0
  def seq(1), do: 1
  def seq(n) when n > 1, do: compute_seq(n, 1, [1, 0])

  defp compute_seq(n, i, acc) when n == i do
    hd(acc)
  end
  defp compute_seq(n, i, acc) do
    compute_seq(n, i+1, [hd(acc) + (acc |> tl |> hd) | acc])
  end
end

IO.puts Fib.seq(50)
