require_relative "../utilities/environment"

# title_scroll
# sleep(1)
character=Character.new
character_create(character) if character.alive==true
enter_dungeon(character) if character.alive==true
dungeon if character.alive==true


if character.alive==false
  puts "You have been overwhelmed by skeletons."
end
