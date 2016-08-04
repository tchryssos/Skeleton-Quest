require_relative "../utilities/environment"

play_again=true

while play_again==true
  # title_scroll
  # sleep(1)
  character=Character.new
  character_create(character) if character.alive==true
  start_dungeon(character) if character.alive==true
  dungeon(character) if character.alive==true


  if character.alive==false
    puts "No one was able to stop the skeletons."
    puts "Everything has been overwhelmed by skeletons.".red
  end

  sleep (1)
  puts
  puts "Play again?"
  puts "(Type 'yes' or 'no')"
  puts "->"
  user_play_again=gets.strip
  if user_play_again.downcase=="no"
    play_again=false
  end
end
