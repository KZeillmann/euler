# Goal: Find the largest prime factor of 600851475143

defmodule Helpers do
  def pollard_rho(n, x, y, d) do
    if d == 1 do
      x = g(x, n)
      y = g(g(y, n), n)
      d = Integer.gcd(abs(x-y), n)
      pollard_rho(n, x, y, d)
    else
      d
    end
  end

  def g(x, n) do
    :math.pow(x, 2) + 1
    |> round
    |> rem(n)
  end
end

big_num =   6857 #10086647 #8462696833 #600851475143 = 71 * 839 * 1471 * 6857

# Use Pollard's rho algorithm for fast prime factorization: https://en.wikipedia.org/wiki/Pollard%27s_rho_algorithm

x = 2
y = 2
d = 1

IO.inspect Helpers.pollard_rho(big_num, x, y, d)

# To solve, see the outputs, and manually divide by the input
