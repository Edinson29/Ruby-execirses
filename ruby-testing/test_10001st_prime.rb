require 'minitest/autorun'
require '../10001st_prime.rb'

describe LastPrime do
  it 'Return 104743 when the parameter is 10001' do
    last_prime = LastPrime.new(10001)
    last_prime.prime.must_equal(104743)
  end
  it 'Return 541 even though the number is like a string' do
    last_prime = LastPrime.new('100')
    last_prime.prime.must_equal(541)
  end
  it 'Return a error when is a word' do 
    err = lambda{last_prime = LastPrime.new('nnt')}.must_raise(TypeError)
    err.message.must_match('That is not number')
  end
end