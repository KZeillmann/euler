# Goal: Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

defmodule Helpers do
  def square_of_sum(range) do
    sum = range
      |> Enum.reduce(&(&1 + &2))
    sum * sum
  end

  def sum_of_squares(range) do
    range
    |> Enum.map(&(&1 * &1))
    |> Enum.reduce(&(&1 + &2))
  end
end

range = 1..100

answer = Helpers.sum_of_squares(range) - Helpers.square_of_sum(range)

IO.inspect abs(answer)
