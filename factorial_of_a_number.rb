#As an engineer I must create a method that receives any number and returns the factorial of that number.
class StringError < StandardError; end

class Factorial
  def parse_num(num)
    raise StringError, "That is not a number" unless is_number?(num)
  end
  def is_number?(num)
    num.to_s == num.to_i.to_s
  end
  def calculate(num = 0)
    parse_num(num)
    num = num.to_i
    num = num.abs
    (1..num).inject(1) { |product, n| product * n }
  end
end