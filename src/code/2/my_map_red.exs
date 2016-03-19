defmodule MapReduce do
  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  def map([], _), do: []
  def map(l, f) do
    reduce(l, [], fn(x, acc) -> [f.(x) | acc] end)
    |> Enum.reverse
  end
end

[1, 2, 3, 4, 5]
|> MapReduce.map(fn(x) -> x * 2 end)
|> IO.inspect
|> MapReduce.reduce(0, fn(x, acc) -> acc + x end)
|> IO.inspect
