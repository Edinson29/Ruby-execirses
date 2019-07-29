# Create a method that receives a word and returns whether it is a palindrom or not
class TypeError < StandardError; end

class LettersPalindromo
	def is_word?(word)
    word = word.chars
    word.all? {|letter| letter.to_s != letter.to_i.to_s}
  end
  def op(word)
    TypeError, 'That is not a word' unless is_word?(word)
  end
  def palindromo?(word)
    op(word)
    word == word.reverse
  end
end
letter = LettersPalindromo.new
puts letter.palindromo?('oso')