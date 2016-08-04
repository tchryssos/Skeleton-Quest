require_relative "../utilities/environment"

def start_dungeon(character)
  enter_choice=will_you_enter
  if enter_choice.include?("yes")
    character.alive
  elsif
    character.alive=why_not_enter(character)
  end
end

def will_you_enter
  puts "Will you enter the "+"Skeletons' Lair".red+"?"
  puts "(Type 'yes' or 'no')"
  puts "->".yellow
  gets.chomp
end

def why_not_enter(character)
  enter_dungeon=false
  puts
  puts "But... but... why won't you help us?"
  puts "(Enter 'I need more time' or 'I don't want to')"
  puts "->".yellow
  no_enter_answer=gets.chomp
  if no_enter_answer.downcase.include?("more time")
    puts
    enter_dungeon=needs_more_time(character)
  elsif no_enter_answer.downcase.include?("want to")
    doesnt_want_to(character)
  else
    puts
    puts "I CAN'T UNDERSTAND YOU"
    character.alive=false
  end
end

def needs_more_time(character)
  puts "..."
  sleep(5)
  puts
  puts "Are you ready now?"
  puts "Enter 'yes' or 'no'"
  puts "->".yellow
  time_answer=gets.chomp
  if time_answer=="no"
    puts
    puts "We're doomed."
    puts
    character.alive=false
  end
end

def doesnt_want_to(character)
  puts
  puts "We're doomed"
  puts
  character.alive=false
end
