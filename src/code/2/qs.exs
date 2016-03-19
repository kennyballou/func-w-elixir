defmodule Quicksort do
  def sort([]), do: []
  def sort([h|t]) do
    {lower, upper} = t |> Enum.partition(&(&1 <= h))
    sort(lower) ++ [h] ++ sort(upper)
  end
end

1..10
  |> Enum.shuffle
  |> IO.inspect
  |> Quicksort.sort
  |> IO.inspect
