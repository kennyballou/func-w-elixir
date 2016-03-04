defmodule WordCount do

  defp stream_file(filename) do
    File.stream!(filename)
  end

  defp tokenize_words(line) do
    line |> Stream.flat_map(&String.split/1)
  end

  defp reduce_words(words) when is_list(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  defp update_count(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end

  def count_words(filename) do
    stream_file(filename)
    |> tokenize_words
    |> Enum.to_list
    |> reduce_words
  end

end

WordCount.count_words("pg51353.txt") |> IO.inspect(limit: 20)
