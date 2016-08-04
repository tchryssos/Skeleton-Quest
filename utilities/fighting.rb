require_relative 'environment'
require 'colorize'

module Fighting

  def fighting(actor_1, actor_2, attack_type)
    if attack_type=="strength"
      if actor_1.strength+rand(1..20)>actor_2.dexterity+rand(1..20)
        puts "Hit! "+["#{actor_1.name} hit #{actor_2.name} with their sword!", "#{actor_1.name} stabs #{actor_2.name}!", "#{actor_2.name} gets sliced across the chest by #{actor_1.name}'s longsword!"].sample
        damage=rand(1..8)
        actor_2.health-=damage
        actor_2.health=[actor_2.health, 0].max
        if actor_2.health==0
          puts "#{actor_2.name} has died!"
        end
      else
        puts "Miss! "+["#{actor_1.name} misses #{actor_2.name} with a wide slice!", "#{actor_2.name} narrowly dodges #{actor_1.name}'s blow!", "#{actor_1.name} lunges at #{actor_2.name}, but #{actor_2.name} escapes the blow!"].sample
      end
    elsif attack_type=="dexterity"
    elsif attack_type=="wisdom"
    elsif attack_type=="flee"
    elsif attack_type=="item"
    end
  end

end
