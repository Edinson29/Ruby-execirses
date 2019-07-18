#As an engineer I must create a method that receives any number and returns the factorial of that number.
def factorial_of_a_number(num=0)
(1..num).inject(1) { |product, n| product * n }
end
puts factorial_of_a_number(5)