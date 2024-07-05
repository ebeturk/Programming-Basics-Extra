def create_word(a_range)
  # TODO: Convert the range to an array
  an_array = a_range.to_a
  # TODO: Remove ['c', 'd'] from the original array by subtraction
  an_array -= ('c'..'d').to_a
  # TODO: Insert 'l' before the last element
  an_array.insert(-2,'l')
  # TODO: Join the elements to form a word
  word = an_array.join
  # TODO: Return the transformed object
  word
end

# Simple test for the create_word method
passing_argument = 'a'..'e' # TODO: Replace 'nil' with a range of letters between a-e including e
# now run the code

# leave this cute test alone
puts create_word(passing_argument) == 'able' ? '🚀' : '💩'
