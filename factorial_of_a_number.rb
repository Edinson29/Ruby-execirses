#As an engineer I must create a method that receives any number and returns the factorial of that number.
class StringError < StandardError; end

class Factorial
  def initialize(num = 0)
    @num = parse_num(num)
  end
  def parse_num(num)
    raise StringError, "That is not a number" unless is_number?(num)
    num.to_i
  end
  def is_number?(num)
    num.to_s == num.to_i.to_s
  end
  def calculate
    @num = @num.abs
    (1..@num).inject(1) { |product, n| product * n }
  end
end