# Create a method that receives a word and returns whether it is a palindrom or not

class LettersPalindromo
  def palindromo?(word)
    word == word.reverse
  end
end
letter = LettersPalindromo.new
puts letter.palindromo?('oso')