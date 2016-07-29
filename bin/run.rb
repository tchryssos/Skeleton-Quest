require_relative "../lib/character"
require_relative "../lib/enter_dungeon"
require_relative "../Utilities/title_scroll.rb"
require_relative "../Utilities/character_create.rb"
require_relative "../lib/dungeon_start"
require 'pry'

title_scroll
sleep(1)
character=Character.new
character_create(character) if character.alive==true
enter_dungeon(character) if character.alive==true
dungeon_start if character.alive==true


if character.alive==false
  puts "Everyone is skeleton."
end
