#As an engineer I must create a method that receives any number and returns the factorial of that number.
def factorial_of_a_number(num=0)
  factorial = 1
  1.upto(num) {|iterator| factorial *= iterator}
  factorial
end
puts factorial_of_a_number(5)