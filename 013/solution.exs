# Goal: Find the first 10 digits of sum of 100 50 digit numbers
{:ok, text} = File.read("bignums.txt")

text
|> String.split("\n")
|> Enum.drop(-1) #last element is empty string
|> Enum.map(&Integer.parse/1)
|> Enum.map(&Kernel.elem(&1, 0)) #Should probably move this parsing into a helper but it works!
|> Enum.reduce(&(&1+&2))
|> Integer.digits
|> Enum.take(10)
|> Integer.undigits
|> IO.inspect
