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

  def collatz_sequence_length(map, num) do
    if map[num] != nil do
      map
    else
      next_num = next_collatz_term(num)
      new_map = collatz_sequence_length(map, next_num)
      
    end
  end
end


1..2
|> Enum.reduce(%{1=>1}, fn(num, map) ->
                          map = Helpers.collatz_sequence_length(map, num)
                          map
                        end)
|> IO.inspect
