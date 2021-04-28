# Goal: Find largest Collatz chain where the starting number < 1_000_000

# Collatz chain rules -- if n is even, next term is n/2, and if n is odd, next term is 3n+1

defmodule Helpers do
  def next_collatz_term(number) do
    if rem(number, 2) == 0 do #if even
      div(number, 2)
    else
      3*number + 1
    end
  end

  def build_collatz_map(map, num) do
    if map[num] != nil do
      map
    else
      next_num = next_collatz_term(num)
      next_sequence_length = build_collatz_map(map, next_num)[next_num]
      Map.put(map, num, next_sequence_length + 1)
    end
  end

end

1..999_999
|> Enum.reduce(%{1 => 1}, fn(num, map) -> Helpers.build_collatz_map(map, num) end)
|> Enum.max_by(fn({_, length}) -> length end)
|> IO.inspect
