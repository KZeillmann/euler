# Goal: Generate sum of even valued terms of fibonacci sequence where the values < 4,000,000
# First, generate the fibonacci sequence where values < 4,000,000
defmodule Helpers do
  def gen_fibonacci(list, max_num) do
    next_term = Enum.at(list, -1) + Enum.at(list, -2)
    if next_term > max_num do
      list
    else
      gen_fibonacci(list ++ [next_term], max_num)
    end
  end
end
[1, 1]
|> Helpers.gen_fibonacci(4000000)
|> Enum.filter(&(rem(&1, 2) == 0))
|> Enum.reduce(&(&1 + &2))
|> IO.inspect
