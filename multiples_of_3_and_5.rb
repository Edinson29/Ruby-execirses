=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=end
def multi
  multiple = 0
  1000.times do |counter|
    multiple += counter if counter % 3 == 0 || counter % 5 == 0
  end
  return multiple 
end
puts multi