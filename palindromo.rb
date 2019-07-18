# Create a method that receives a word and returns whether it is a palindrom or not

def palindromo(word)
  word == word.reverse ? true : false
end
puts palindromo('asa')