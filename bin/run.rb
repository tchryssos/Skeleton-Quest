require_relative "../utilities/environment"

play_again=true
true_victory=false

system "clear"
title_scroll
sleep(1)
while play_again==true
  character=Character.new
  character_create(character) if character.alive==true
  start_dungeon(character) if character.alive==true
  dungeon(character, true_victory) if character.alive==true


  if character.alive==false
    puts
    puts "No one was able to stop the skeletons."
    sleep (1.5)
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
    puts
    puts "Thanks for playing "+"Skeleton Quest".red+"!"
  end
  sleep(1)
  puts
  system "clear"
end
