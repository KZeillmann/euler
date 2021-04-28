# Goal: A find the sum of all positive integers that
#  cannot be written as the sum of two abundant numbers.

# Abundant number means the sum of its divisors exceeds the number, like
#  12 < 1 + 2 + 3 + 4 + 6 + = 16
# All numbers greater than 28123 can be written as the sum of two abundant numbers.

defmodule Helpers do
  def is_abundant?(num) do
    #find factors

  end

end

# Find all positive integers that cannot be written as the sum of two abundant numbers


1..28_123
|> Enum.filter(fn(num) -> !Helpers.can_be_written_as_sum_of_abundant_nums(num) end)
