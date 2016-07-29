require_relative "../lib/character.rb"
require 'pry'

def character_create(character)
    character.name=character_name(character)
    character.class=character_class(character.name) if character.alive==true
    character.character_class if character.alive==true
end

## CHARACTER NAME METHODS ##

def character_name(character)
  char_name=get_name
  if char_name.downcase.include?("skeleton")
    puts "I won't fall for your tricks skeleton! You are no warrior ... be gone, filthy beast!"
    puts
    puts "You have been banished!"
    character.alive=false
  else
    puts "#{char_name}? Did I hear that correctly? \n(Type yes or no)"
    puts "->"
    name_confirm = gets.chomp
    puts
    until name_confirm == "yes"
      # name_confirm=name_confirmation[0]
      # char_name=name_confirmation[1]
      # binding.pry
      puts "My mistake. Lean a little closer and tell me again..."
      puts "->"
      char_name=gets.chomp
      puts
      puts "#{char_name}? Is that what you said? \n(Type yes or no)"
      puts "->"
      name_confirm=gets.chomp
      puts
    end
    if char_name.downcase.include?("skeleton")
      puts "Your attempts at disguising your skeleton nature have failed! You are banished!"
      puts
      character.alive=false
    else
      puts "Mmm... yes...that is a good name."
      puts
    end
  end
  char_name
end

def get_name
  puts "What is your name, warrior?"
  puts "->"
  given_name=gets.chomp
  puts
  given_name
end

# def name_confirmation
#   puts "My mistake. Lean a little closer and tell me again..."
#   puts "->"
#   char_name=gets.chomp
#   puts
#   puts "#{char_name}? Is that what you said? \n(Type yes or no)"
#   puts "->"
#   confirm=gets.chomp
#   confirm_array=["#{confirm}","#{char_name}"]
#   confirm_array
# end

## CHARACTER CLASS METHODS ##

def character_class(name)
  class_select_text(name)
  user_input=gets.chomp
  user_class=false
  until user_class
    if user_input.downcase=="classes"
      classes_text
      user_input=gets.chomp
    elsif user_input.downcase == "knight"
      user_class=text_knight
    elsif user_input.downcase == "wizard"
      user_class=text_wizard
    elsif user_input.downcase=="thief"
      user_class=text_thief
    else
      text_other
      user_input=gets.chomp
      puts
    end
  end
  user_class
end

def class_select_text(character_name)
  puts "Now, #{character_name}, what kind of warrior are you?"
  puts "(Type Classes to learn about the available classes\nor type Knight, Wizard, or Thief)"
  puts "->"
end

def classes_text
  puts
  puts "CLASSES"
  puts "Knight- Master of the blade. Noble and just."
  puts "Wizard- Master of the arcane. Wise beyond his years."
  puts "Thief-  Master of the bow. An elusive hunter."
  puts 
  puts "What kind of warrior are you?"
  puts "->"
end

def text_knight
  puts
  puts "Hail knight! We're counting on you to slay many skeletons!"
  "knight"
end

def text_wizard
  puts
  puts "Greetings wizard! We hope your magical prowess can end this skeleton plague!"
  "wizard"
end

def text_thief
  puts
  puts "Welcome thief. Use all your cunning to defeat the skeleton scourge."
  "thief"
end

def text_other
  puts
  puts "What's that? Speak up, my hearing isn't what it used to be..."
  puts "(Please type Classes, Knight, Wizard, or Thief)"
  puts "->"
end

