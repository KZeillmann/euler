# Goal: Find the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9
defmodule Helpers do\
  # Following stolen shamelessly from https://elixirforum.com/t/most-elegant-way-to-generate-all-permutations/2706
  def permutations([]), do: [[]]
  def permutations(list) do
    for elem <- list, rest <- permutations(list--[elem]), do: [elem|rest]
  end
end


["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
|> Helpers.permutations
|> Enum.map(&Enum.join/1)
|> Enum.at(999_999)
|> IO.inspect
