# Goal: Find number of Sundays that fell on the first on the month
# Between 1 Jan 1901- 31 Dec 2000

Date.range(~D[1901-01-01], ~D[2000-12-31])
|> Enum.filter(&(&1.day == 1))
|> Enum.filter(&(Date.day_of_week(&1) == 7)) #7 represents Sunday
|> Enum.count
|> IO.inspect
