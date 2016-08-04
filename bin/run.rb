require_relative "../utilities/environment"

play_again=true

while play_again==true
  title_scroll
  sleep(1)
  character=Character.new
  character_create(character) if character.alive==true
  start_dungeon(character) if character.alive==true
  dungeon(character) if character.alive==true


  if character.alive==false
    puts
    puts "No one was able to stop the skeletons."
    sleep (2)
    puts "Everything has been overwhelmed by skeletons.".red
    puts
    sleep(1)
  end

  sleep (1)
  puts "Play again?"
  puts "(Type 'yes' or 'no')"
  puts "->".yellow
  user_play_again=gets.strip
  if user_play_again.downcase=="no"
    play_again=false
  end
end
