def sum_of_the_squares(num=1)
  (1..num).inject{|result, n| result + n**2}
end
def square_of_the_sum(num=1)
  respuest = 0
  (1..num).inject{|result, n| respuest = result +n }
  respues = respuest ** 2
end
def square_differentiator
  square_of_the_sum(100) - sum_of_the_squares(100)
end
puts square_differentiator