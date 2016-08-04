require_relative "../utilities/environment"

def dungeon(character)
  puts
  puts "After a brief journey, you arrive at the "+"Skeletons' Lair".red+"."
  puts "You pull the great metal doors open and step into the inky blackness beyond."
  puts "As your eyes begin adjusting to the darkness, the door behind you closes."
  puts "You push deeper into the lair..."
  victory = false
  while character.alive==true && victory==false
    room=DungeonRoom.new(character)
    room_start(room)
    dungeon_input=gets.strip
    dungeon_choices(dungeon_input,room)


  end
end

def room_start(room)
  puts
  puts "You enter into a new room. Beware! A #{room.enemy.name} approaches!"
  puts
  puts "What will you do?"
  puts "(Enter a command or type 'help' to see available commands)"
  puts "->".yellow
end

def dungeon_choices(user_input, room)
  puts
  if user_input.downcase == "help"
    dungeon_help
    user_input=gets.strip
    dungeon_choices(user_input, room)
  elsif user_input.downcase == "flee"
    dungeon_flee(room)
  elsif user_input.downcase == "exit"
    room.character.alive=false
  elsif user_input.downcase == "fight"
  elsif user_input.downcase == "stats"
    player_stats(room)
    user_input=gets.strip
    dungeon_choices(user_input, room)
  else
    puts "Please choose 'fight', 'flee', 'exit' or 'help'"
    puts "->".yellow
    user_input=gets.strip
    dungeon_choices(user_input, room)
  end

    #### RUN WHILE LOOP TO KEEP IN CHOICES UNTIL FIGHT RESOLVES OR PERSON FLEES ###

end

def dungeon_help
  puts
  puts "Fight - Battle your foe!"
  puts "Flee - Flee from the dungeon..."
  puts "Stats - See your current stats"
  puts "Help - See this menu again"
  puts "Exit - Quit the game"
  puts
  puts "What will you do?"
  puts "(Enter a command or type 'help' to see available commands)"
  puts "->".yellow
end

def dungeon_flee(room)
  puts
  puts "You flee from the "+"#{room.enemy.name}, and run out of the dungeon."
  puts "Your cowardice has doomed us all."
  room.character.alive=false
end

def player_stats(room)
  room.character.stats
  puts
  puts "What will you do?"
  puts "(Enter a command or type 'help' to see available commands)"
  puts "->".yellow
end
