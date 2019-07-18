# Create a method that receives a word and returns whether it is a palindrom or not

def palindromo(word)
	word == word.reverse ? 'Es un polindromo' : 'No es un polindromo'
end
puts palindromo('butifarra')