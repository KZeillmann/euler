# Goal: Find the 13 adjacent digits in this 1000 digit number that have the largest product

defmodule Helpers do
  def get_adjacent_products(digits, num) do
    Enum.slice(digits, num..(num+12))
    |> Enum.reduce(1, &(&1*&2))
  end
end



{:ok, text} = File.read("large_num.txt")

digits = text
  |> String.split("\n") #because don't feel like looking up the String.replace/4 arguments
  |> Enum.join("")
  |> Integer.parse
  |> Kernel.elem(0)
  |> Integer.digits

0..1000
|> Enum.map(fn(x) ->
              Helpers.get_adjacent_products(digits, x)
            end)
|> Enum.sort
|> Enum.at(-1)
|> IO.inspect
