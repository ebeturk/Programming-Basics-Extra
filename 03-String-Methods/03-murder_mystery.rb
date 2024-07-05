# Ruby Riddles: The Code Mystery

# Introduction
puts 'Welcome to Ruby Riddles: The Code Mystery!'
puts 'A murder has occurred, and only your Ruby coding skills can solve it.'
puts "You need to find: The Murderer's Name, Murder Weapon, Hour of the Murder, and the Murder Room."
puts "Use Ruby methods on the variable 'code' to uncover the clues."

# Initial Data
code = 'ermEWeaponTimeStudy'
weapon_array = ["🔪", "🔫", "🏹", "🪓", "⚔️"]

# Helper Function: Ask a Ruby question until the correct answer is given
def ask_question(question, correct_answers, success_message)
  loop do
    puts "\n #{question}"
    print '> '
    answer = gets.chomp
    if correct_answers.include?(answer.downcase)
      puts success_message
      break
    else
      puts "That's not the right answer. Try again!"
    end
  end
end

# Helper Function: Evaluate user code safely
def evaluate_code(user_code, context_binding)
  begin
    result = context_binding.eval(user_code)
    return result
  rescue StandardError => e
    puts "That's not the right answer. Your output was: #{e.message}. Try again!"
    print '> '
    return nil
  end
end

# Murder Hour: Length of the 'code' variable
ask_question("Riddle 1: What method in Ruby returns the length of a string?", ["length", "size", "count"], "Correct! Now, apply this method to the 'code' variable to find the hour of the murder.")
puts "Enter your Ruby code using the correct method on 'code':"
print '> '

context_binding = binding
hour = nil
loop do
  user_code = gets.chomp
  hour = evaluate_code(user_code, context_binding)
  if hour
    puts "Hour of the Murder: #{hour} o'clock"
    break
  end
end

# Murder Weapon: Last element of an array of emojis
ask_question("Riddle 2: What method fetches the last element from an array?", ["last"], "Correct! Use this method on 'weapon_array' to find the murder weapon.")
puts "Enter your Ruby code using the correct method on 'weapon_array':"
print '> '

weapon = nil
loop do
  user_code = gets.chomp
  weapon = evaluate_code(user_code, context_binding)
  if weapon
    puts "Murder Weapon: #{weapon}"
    break
  end
end

# Murderer Name
ask_question("Riddle 3: What method in Ruby reverses a string?", ["reverse"], "Correct! Reverse and capitalize the first four characters of 'code' to reveal the murderer's name.")
puts "Enter your Ruby code to reverse and capitalize the first four characters of 'code':"
print '> '

murderer = nil
loop do
  user_code = gets.chomp
  murderer = evaluate_code(user_code, context_binding)
  if murderer && murderer.downcase == "emre"
    puts "Murderer's Name: #{murderer.capitalize}"
    break
  else
    puts "That's not the correct code. Your output was: #{murderer}. Try again!"
    print '> '
  end
end

# Murder Room
ask_question("Riddle 4: What Ruby method returns a substring from a string? It starts with an 's'.", ["slice"], "Correct! Use this method to extract the murder room from 'code' (slice from 14 to 19).")
puts "Enter your Ruby code to extract the murder room from 'code':"
print '> '

room = nil
loop do
  user_code = gets.chomp
  room = evaluate_code(user_code, context_binding)
  if room
    puts "Murder Room: #{room}"
    break
  end
end

# Summary of the Mystery
hour = evaluate_code("code.length", context_binding)
weapon = evaluate_code("weapon_array.last", context_binding)
murderer = evaluate_code("code[0..3].reverse.capitalize", context_binding)
room = evaluate_code("code.slice(14..19)", context_binding)

# Solution String
solution = "Emre murdered the victim with a ⚔️ in the Study at 19 o'clock"

# Check the Answers and Play Sound if Correct
final_answer = "#{murderer} murdered the victim with a #{weapon} in the #{room} at #{hour} o'clock"

if final_answer == solution
  puts "\nMystery Solved! You've cracked the case!"
  puts solution  # Print the solution string

  # Determine the platform and play the sound file accordingly
  if RUBY_PLATFORM =~ /darwin/  # macOS
    system("afplay trumpet.mp3")
  elsif RUBY_PLATFORM =~ /mswin|mingw|cygwin/  # Windows
    system("start trumpet.mp3")
  elsif RUBY_PLATFORM =~ /linux|unix/  # Linux/Unix
    system("aplay trumpet.mp3")  # or 'paplay' or other command depending on the Linux distro
  else
    puts "Sound playback not supported on this operating system."
  end
else
  puts "\nNot quite right. The mystery remains unsolved."
end
