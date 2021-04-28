# Goal: Find maximum total from top to bottom of triangle in triangle.txt

# Copy-pasted the solution from problem 18

defmodule Helpers do
  def parse_file(text) do
    text
    |> String.split("\n")
    |> Enum.drop(-1) #drop last empty string from array
    |> Enum.map(&Helpers.parse_line/1)
  end

  def parse_line(line) do
    ints_as_strings = line
      |> String.split(" ")

    ints_as_strings
    |> Enum.map(fn(int) ->
                  {num, _} = Integer.parse(int)
                  num
                end)

  end

  def find_max_sum(acc, ints)do
      ints
      |> Enum.with_index
      |> Enum.map(fn({val, index}) ->
                    max_preceding = Enum.max([
                      Enum.at(acc, index, 0), Enum.at(acc, index-1, 0)
                      ])
                    val + max_preceding
                  end)
  end
end

{:ok, text} = File.read("triangle.txt")

text
|> Helpers.parse_file
|> Enum.reduce(fn(ints, accumulator) -> Helpers.find_max_sum(accumulator, ints) end)
|> Enum.max
|> IO.inspect
