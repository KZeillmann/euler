# Goal: Find 10001st prime

# This is inefficient and violates the 30s rule but it worked
defmodule Helpers do
  def find_primes(primes, limit) when limit > 1 do
    if Enum.count(primes) > limit do
      Enum.at(primes, limit - 1)
    else
      find_primes(find_more_primes(primes, Enum.at(primes, -1)), limit)
    end
  end

  def find_more_primes(primes, test_num) do
    prime_factors = Enum.map(primes, &(rem(test_num, &1)))
      |> Enum.filter(&(&1 == 0))

    if prime_factors == [] do
      primes ++ [test_num]
    else
      find_more_primes(primes, test_num + 1)
    end
  end
end

IO.inspect Helpers.find_primes([2], 10001)
