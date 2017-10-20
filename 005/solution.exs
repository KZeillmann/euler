# Goal: Find the smallest number that's evenly divisible by numbers 1-20

# Finding the least common multiple of 1..20 can really be done by hand with prime factorization

# 1 = 1
# 2 = 2
# 3 = 3
# 4 = 2 * 2
# 5 = 5
# 6 = 3 * 2
# 7 = 7
# 8 = 2 * 2 * 2
# 9 = 3 * 3
# 10 = 5 * 2
# 11 = 11
# 12 = 2 * 2 * 3
# 13 = 13
# 14 = 7 * 2
# 15 = 3 * 5
# 16 = 2 * 2 * 2 * 2
# 17 = 17
# 18 = 3 * 3 * 2
# 19 = 19
# 20 = 5 * 2 * 2

# 2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 multiply prime numbers
# ensure we have enough other factors (3 2s, 2 3s)

IO.inspect (2 * 2 * 2 * 2 * 3 * 3 * 5 * 7 * 11 * 13 * 17 * 19)
