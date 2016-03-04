defmodule Quicksort do
  def sort([]), do: []
  def sort([h|t]) do
    lower = t |> Enum.filter(&(&1 <= h))
    upper = t |> Enum.filter(&(&1 > h))
    sort(lower) ++ [h] ++ sort(upper)
  end
end

1..10 |> Enum.shuffle |> Quicksort.sort |> IO.inspect
