# Goal: Find sum of all amicable numbers under 10_000

# Amicable pairs are pairs a, b where d(a) = b, d(b) = a, a!=b, and d(n) is the sum
# of the proper divisors of n (numbers < n that divide into n)

defmodule Helpers do
  def proper_divisor_sum(num) do
    half_num = round(num/2)
    1..half_num
    |> Enum.filter(&(rem(num, &1) == 0))
    |> Enum.reduce(&(&1+&2))
  end
end

d_map_tuples = 1..10_000
|> Enum.map(&({&1, Helpers.proper_divisor_sum(&1)}))

Enum.filter(d_map_tuples, fn({a, b}) ->
                            Enum.member?(d_map_tuples, {b, a})
                          end)
|> Enum.filter(fn({a, b}) -> a != b end)
|> Enum.map(fn({a, _}) -> a end)
|> Enum.reduce(&(&1+&2))
|> IO.inspect
