# Goal: Find count of non-whitespace letters when all numbers 1-1000 are written out in words
# Probably gonna be a lot of hardcoding in here

defmodule Helpers do
  @word_map %{ 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six",
                7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve",
                13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen",
                18 => "eighteen", 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty",
                50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety" }
  def write_in_words(num) do
    if num == 1000 do #lazy implementation
      "one thousand"
    else
      hundreds = write_hundreds(num, @word_map)
      tens = write_tens(num, @word_map)
      ones = write_ones(num, @word_map)

      hundreds <> tens <> ones
      |> String.trim
    end
  end

  def write_hundreds(num, map \\ @word_map) do
    if num < 100 do
      ""
    else
      hundreds_place = div(num, 100)
      hundred_words = map[hundreds_place] <> " hundred"
      if rem(num, 100) == 0 do
        hundred_words
      else
        hundred_words <> " and "
      end
    end
  end

  def write_tens(num, map \\ @word_map) do
    tens = rem(div(num,10), 10)
    if num < 10 || tens == 0 do
      ""
    else
      tens_place = rem(div(num, 10), 10)
      if tens_place == 1 do
        map[rem(num, 100)] # get last two digits
      else
        map[tens_place*10]
      end
    end
  end

  def write_ones(num, map \\ @word_map) do
    ones = rem(num, 10)
    tens = rem(div(num,10), 10)
    if tens == 1 || ones == 0 do #if tens place is 1 or ones place is 0
      ""
    else
      " " <> map[ones]
    end
  end
end

1..1000
|> Enum.map(&Helpers.write_in_words/1)
|> Enum.join
|> String.split
|> Enum.filter(&(&1 != " "))
|> Enum.join
|> String.length
|> IO.inspect
