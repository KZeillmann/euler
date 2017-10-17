#Goal: Find the sum of multiples of 3 or 5 below 1000

1..999
|> Enum.filter(fn(x) ->
                rem(x, 3) == 0 || rem(x, 5) == 0
              end)
|> Enum.reduce(&(&1 + &2))
|> IO.inspect
