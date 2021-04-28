# Goal: Find the largest palindrome that is the product of two three digit numbers

# Try the dumb solution -- multiplying all 3 digit numbers by all other 3 digit numbers, filtering on solution

defmodule Helpers do
  def is_palindrome(num) do
    reverse_num =
      num
      |> Integer.to_string
      |> String.reverse

    Integer.to_string(num) == reverse_num
  end
end

range = 100..999




range
# this is messy
|> Enum.map(fn(x) ->
              Enum.map(range, fn(y) -> x * y end)
            end)
|> Enum.concat
|> Enum.sort
|> Enum.dedup
|> Enum.filter(&(Helpers.is_palindrome/1))
|> Enum.at(-1) #last element, since we already sorted
|> IO.inspect
