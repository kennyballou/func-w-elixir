defmodule MyReduce do
  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end
end

[1, 2, 3, 4, 5] |>
MyReduce.reduce(0, fn(x, acc) -> x + acc end)
|> IO.inspect
