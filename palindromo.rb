# Create a method that receives a word and returns whether it is a palindrom or not

class LettersPalindromo
  def initialize(word = 'o')
    @word = validate_error(word)
  end
	def is_word?(word)
    word = word.chars
    word.all? {|letter| letter.to_s != letter.to_i.to_s}
  end
  def validate_error(word)
    raise TypeError, 'That is not a word' unless is_word?(word)
    word
  end
  def palindromo?
    @word == @word.reverse
  end
end