#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

loop do
  welcome
  character = get_character_from_user

  if character == "exit"
    break
  elsif get_character(character) == nil
    puts "No such character"
  else
    input_array = get_character_attribute_from_user(character)
    choose_method(input_array)
  end
end
