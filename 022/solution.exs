# Goal: Given file `names.txt`, sort them into alphabetical order,
# score each name by the following formula
# place in list * alphabetical value of name (sum of letters where A=1 and Z=26)

defmodule Helpers do
  def parse_file(text) do
    text
    |> String.split(",")
    |> Enum.map(fn(name) ->
                  String.replace(name, "\"", "") #Get rid of quotes -- probably possible to do before splitting to make it cleaner
                end)
    |> Enum.sort
  end

  def score_names(names) do
    names
    |> Enum.with_index
    |> Enum.map(fn({name, index}) -> {name, index+1} end) #convert index to place
    |> Enum.map(fn({name, place}) ->
                  alphabetical_value(name) * place
                end)
  end

  def alphabetical_value(name) do
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.codepoints
    alphabet_map = Enum.zip(alphabet, 1..26) |> Enum.into(%{})
    name
    |> String.codepoints #somehow I've missed this method in all previous solutions --- clearer than String.split("") |> Enum.drop(-1)
    |> Enum.map(fn(char) ->
                  alphabet_map[char]
                end)
    |> Enum.reduce(&(&1+&2))
  end
end


{:ok, text} = File.read("names.txt")

text
|> Helpers.parse_file
|> Helpers.score_names
|> Enum.reduce(&(&1+&2))
|> IO.inspect
