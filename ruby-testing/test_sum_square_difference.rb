require 'minitest/autorun'
require '../sum_square_difference.rb'

describe SumSquareDifference do
  it "Return 2640 when the two numbers are 10" do
    sum_square = SumSquareDifference.new(10,10)
    sum_square.square_differentiator.must_equal(2640)
  end
  it "Return 2640 even though the numbers are a string" do
    sum_square = SumSquareDifference.new('10','10')
    sum_square.square_differentiator.must_equal(2640)
  end
  it "Return a error when is a word" do
    err = lambda {sum_square = SumSquareDifference.new('word','avar')}.must_raise(TypeError)
    err.message.must_match('That is not number')
  end
end