defmodule MyMap do
  def map([], _), do: []
  def map([h|t], f) do
    [f.(h)] ++ map(t, f)
  end
end

[1, 2, 3, 4, 5] |> MyMap.map(fn(x) -> x * 2 end) |> IO.inspect
