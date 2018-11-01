# Goal: Find sum of primes below 2_000_000
defmodule Helpers do
  def sieve_of_eratosthenes(max_num) do
    2..max_num
    |> Enum.map(&({&1, true}))
    |> Enum.into(%{})
    |> sieve_of_eratosthenes(max_num, 2)
    |> Enum.filter(fn({_, bool}) -> bool end)
    |> Enum.map(fn({num, _}) -> num end)
    |> Enum.sort
    |> Enum.drop(-1)
  end

  def sieve_of_eratosthenes(sieve, max_num, test_num) do
    if test_num > :math.sqrt(max_num) do
      sieve
    else
      sieve =
        if Map.get(sieve, test_num) do
          mark_off(sieve, max_num, test_num) #unsafe variable, whatever
        else
          sieve
        end
      sieve_of_eratosthenes(sieve, max_num, test_num + 1)
    end
  end

  def mark_off(sieve, max_num, test_num) do
    Stream.iterate(test_num*test_num, &(&1 + test_num))
    |> Enum.take_while(fn(x) -> x < max_num end)
    |> Enum.reduce(sieve, fn(entry, map) ->
                            %{map | entry => false}
                          end)
  end
end

Helpers.sieve_of_eratosthenes(2_000_000)
|> Enum.reduce(&(&1 + &2))
|> IO.inspect
