# Goal: Find sum of digits of 2^1000

:math.pow(2, 1000)
|> Kernel.round
|> Integer.digits
|> Enum.reduce(&(&1+&2))
|> IO.inspect
