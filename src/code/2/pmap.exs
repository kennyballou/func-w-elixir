defmodule MyMap do
  def pmap(collection, f) do
    collection |>
    Enum.map(&(Task.async(fn -> f.(&1) end))) |>
    Enum.map(&Task.await/1)
  end
end

MyMap.pmap(1..10_000, &(&1 * &1)) |> IO.inspect
