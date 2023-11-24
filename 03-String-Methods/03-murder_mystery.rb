# Ruby Riddles: The Code Mystery

# Introduction
puts 'Welcome to Ruby Riddles: The Code Mystery!'
puts 'A murder has occurred, and only your Ruby coding skills can solve it.'
puts "You need to find: The Murderer's Name, Murder Weapon, Hour of the Murder, and the Murder Room."
puts "Use Ruby methods on the variable 'code' to uncover the clues."

# Initial Data
code = 'ermEWeaponTimeStudy'

# Helper Function: Ask a Ruby question until the correct answer is given
def ask_question(question, correct_answer, success_message)
  loop do
    puts "\n #{question}"
    answer = gets.chomp
    if answer == correct_answer
      puts success_message
      break
    else
      puts "That's not the right answer. Try again!"
    end
  end
end

# Murder Hour: Length of the 'code' variable
ask_question("Riddle 1: What method in Ruby returns the length of a string?", "length", "Correct! Now, apply this method to the 'code' variable to find the hour of the murder.")
puts "Enter your Ruby code (e.g., variable.size):"
user_code = gets.chomp
puts "Hour of the Murder: #{eval(user_code)} o'clock"

# Murder Weapon: Last element of an array of emojis
weapon_array = ["🔪", "🔫", "🏹", "🪓", "⚔️"]
ask_question("Riddle 2: What method fetches the last element from an array?", "last", "Correct! Use this method on 'weapon_array' to find the murder weapon.")
puts "Enter your Ruby code (e.g., array_name.first):"
user_code = gets.chomp
puts "Murder Weapon: #{eval(user_code)}"

# Murderer Name
ask_question("Riddle 3: What method in Ruby reverses a string?", "reverse", "Correct! Reverse and capitalize the first four characters of 'code' to reveal the murderer's name.")
puts "Enter your Ruby code (e.g., code[index_range].methoda.methodb):"
user_code = gets.chomp
puts "Murderer's Name: #{eval(user_code)}"

# Murder Room
ask_question("Riddle 4: What Ruby method returns a substring from a string? It starts with an 's'.", "slice", "Correct! Use this method to extract the murder room from 'code' (slice from 14 to 19).")
puts "Enter your Ruby code (e.g., code.slice(slice_range)):"
user_code = gets.chomp
puts "Murder Room: #{eval(user_code)}"

# Summary of the Mystery
hour = eval("code.length")
weapon = eval("weapon_array.last")
murderer = eval("code[0..3].reverse")
room = eval("code.slice(14..19)")

# Solution String
solution = "Emre murdered the victim with a ⚔️ in the Study at 19 o'clock"

# Check the Answers and Play Sound if Correct
puts final_answer = "#{murderer} murdered the victim with a #{weapon} in the #{room} at #{hour} o'clock"

if final_answer == solution
  puts "\nMystery Solved! You've cracked the case!"

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
