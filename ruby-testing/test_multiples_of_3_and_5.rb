require "minitest/autorun"
require "../multiples_of_3_and_5.rb"

class MultiplesTest < Minitest::Test
  def test_calculate
    multiples = MultiplesOf3And5.new
    assert_equal 23, multiples.calculate(10)
  end
end