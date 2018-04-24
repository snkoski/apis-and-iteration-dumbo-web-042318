def welcome
  # puts out a welcome message here!
  puts "May the force be with you?"
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end

def get_character_attribute_from_user(character)
  puts "What would you like to know?"
  puts "\n Height, Films, Species"
  input_array = [character]
  input_array << gets.chomp
end
