# Goal: Find product abc where a + b + c = 1000 and a^2 + b^2 = c^2

# iterate through all positive integers where a + b + c = 1000

a_and_b = 1..998
|> Enum.map(fn(x) ->
              1..998
              |> Enum.map(fn(y) ->
                            {x, y}
                          end)
            end)

|> List.flatten
|> Enum.filter(fn(x) ->
                a = elem(x, 0)
                b = elem(x, 1)
                c = :math.sqrt(:math.pow(a, 2)+:math.pow(b, 2))
                # c = round(c)
                a + b + c == 1000
               end)
 #Now you have a and b
|> Enum.at(0)

a = elem(a_and_b, 0)
b = elem(a_and_b, 1)
c = 1000-a-b

IO.inspect a*b*c
