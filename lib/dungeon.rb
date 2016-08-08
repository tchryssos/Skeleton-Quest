require_relative "../utilities/environment"

def dungeon(character, true_victory_status)
  traveling_text
  victory = false
  room=DungeonRoom.new(character)
  room_start(room)
  dungeon_input=gets.strip
  while character.alive==true && victory==false
    dungeon_choices(dungeon_input,room)
    if room.enemy.alive==false
      victory=true
    elsif room.character.health==0
      character.alive=false
    end
    if victory==true
      puts "You have defeated the skeleton menace in this room!".green
      puts
      loot_drop(room)
      if true_victory_status==false
        puts "More skeletons await ahead...".red
      end
      puts
    end
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
    dungeon_fight(room)
  elsif user_input.downcase == "stats"
    puts player_stats(room)
    user_input=gets.strip
    dungeon_choices(user_input, room)
  else
    puts "Please choose 'fight', 'flee', 'exit' or 'help'"
    puts "->".yellow
    user_input=gets.strip
    dungeon_choices(user_input, room)
  end
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

def dungeon_fight(room)
  puts
  dungeon_fight_text
  fight_input=gets.strip
  puts
  if fight_input.downcase == "sword"
    dungeon_fight_sword(room)
    dungeon_after_combat_round(room) unless room.character.health==0 || room.enemy.health == 0
    dungeon_fight(room) unless room.character.health==0 || room.enemy.health == 0
  elsif fight_input.downcase == "bow"
    dungeon_fight_bow(room)
    dungeon_after_combat_round(room) unless room.character.health==0 || room.enemy.health == 0
    dungeon_fight(room) unless room.character.health==0 || room.enemy.health == 0
  elsif fight_input.downcase == "spell"
    dungeon_fight_spell(room)
    dungeon_after_combat_round(room) unless room.character.health==0 || room.enemy.health == 0
    dungeon_fight(room) unless room.character.health==0 || room.enemy.health == 0
  elsif fight_input.downcase == "flee"
    dungeon_fight_flee(room)
  elsif fight_input.downcase == "stats"
    puts
    puts room.character.stats
    dungeon_fight(room)
  end
end

def dungeon_fight_sword(room)
  room.character.fighting(room.character, room.enemy, "strength")
  sleep(1)
  puts
  enemy_combat_round(room)
end

def dungeon_fight_bow(room)
  room.character.fighting(room.character, room.enemy, "dexterity")
  sleep(1)
  puts
  enemy_combat_round(room)
end

def dungeon_fight_spell(room)
  room.character.fighting(room.character, room.enemy, "wisdom")
  sleep(1)
  puts
  enemy_combat_round(room)
end

def dungeon_fight_flee(room)
  room.character.fighting(room.character, room.enemy, "flee")
end

def dungeon_fight_text
  puts "What will you attack with?"
  puts "(type 'sword', 'bow', or 'spell' to attack, \ntype 'stats' to view your current stats, type 'flee' to exit combat)"
  puts "->".yellow
end

def dungeon_after_combat_round(room)
  puts
  sleep (2)
  puts room.enemy.talk.sample.yellow unless room.enemy.health==0
end

def enemy_combat_round(room)
  if room.enemy.health==0
    room.enemy.alive=false
  else
    puts "#{room.enemy.name} attacks!"
    sleep(1)
    enemy_attack_type=rand(1..4)
    if enemy_attack_type == 4
      room.enemy.fighting(room.enemy, room.character, "dexterity")
    else
      room.enemy.fighting(room.enemy, room.character, "strength")
    end
  end
  if room.character.health==0
    room.character.alive=false
  end
end

def traveling_text
  puts
  "...".each_char do |c|
    puts c
    sleep(0.5)
  end
  puts
  puts "After a brief journey, you arrive at the "+"Skeletons' Lair".red+"."
  puts "You pull the great metal doors open and step into the inky blackness beyond."
  puts "As your eyes begin adjusting to the darkness, the door behind you closes."
  puts "You push deeper into the lair..."
  sleep(2)
end

def loot_drop(room)
  drops=room.enemy.drop_loot
  if drops !=nil
    puts "You found #{drops.name}! Equip now?"
    puts "(Enter 'yes' or 'no')"
    puts "->".yellow
    equip_answer=gets.strip
    if equip_answer=="yes" && drops.weapon_type == "melee"
      puts
      puts "#{room.character.name} replaced #{room.character.equipped_melee_weapon.name} with #{drops.name}!"
      puts
      room.character.equipped_melee_weapon=drops
    elsif equip_answer=="yes" && drops.weapon_type == "ranged"
      puts
      puts "#{room.character.name} replaced #{room.character.equipped_ranged_weapon.name} with #{drops.name}!"
      puts
      room.character.equipped_ranged_weapon=drops
    elsif equip_answer=="yes" && drops.weapon_type == "spell"
      puts
      puts "#{room.character.name} replaced #{room.character.equipped_spell.name} with #{drops.name}!"
      puts
      room.character.equipped_spell=drops
    end
  end
end
