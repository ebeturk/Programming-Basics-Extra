# TODO: Complete the following method, and make the little test pass

def transform_string(str)
  # TODO: 1: Remove leading and trailing whitespace
  p str.strip!
  # TODO: 2: Replace 'C' with 'D' and 'T' with 'Y'
  p str.tr!('CT', 'DY')
  # TODO: 3: Convert the string to lowercase
  p str.downcase!
  # TODO: 4: Reverse the string
  p str.reverse!
  # TODO: 5: Insert a space after the 4th character
  p str.insert(4, ' ')
  # TODO: 6: Capitalize the string
  p str.capitalize!
  # TODO: 7: Return the transformed string
  str
end

# now run the code

# leave this cute test alone
puts transform_string('   CRAZIWTBUR  ') == 'Ruby wizard' ? '🚀' : '💩'
