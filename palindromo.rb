# Create a method that receives a word and returns whether it is a palindrom or not

class Letters_Palindromo
  def palindromo?(word)
    word == word.reverse
  end
end
pal = Letters_Palindromo.new
puts pal.palindromo?('oso')