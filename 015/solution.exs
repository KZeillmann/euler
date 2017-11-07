# Goal: Find number of ways to go down and right in a 20x20 grid

# This is combinatorics

# Sequences of down and right in different orders

# 6 = 4!/(2!2!)

# x = 40!/(20!20!)

defmodule Helpers do
  def factorial(n) when n > 0 do
    1..n
    |> Enum.reduce(1, &(&1*&2))
  end
end

IO.inspect Helpers.factorial(40)/Helpers.factorial(20)/Helpers.factorial(20)
