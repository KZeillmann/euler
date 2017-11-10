# Goal: Find sum of digits of 100!

# Taken from problem 15
defmodule Helpers do
  def factorial(n) when n > 0 do
    1..n
    |> Enum.reduce(1, &(&1*&2))
  end
end

100
|> Helpers.factorial
|> Integer.digits
|> Enum.reduce(&(&1+&2))
|> IO.inspect
