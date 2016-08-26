require_relative 'environment'
require 'colorize'

module Fighting

  def fighting(actor_1, actor_2, attack_type)
    if attack_type=="strength"
      fighting_sword(actor_1, actor_2)
    elsif attack_type=="dexterity"
      fighting_bow(actor_1, actor_2)
    elsif attack_type=="wisdom"
      fighting_spell(actor_1, actor_2)
    elsif attack_type=="flee"
      puts
      puts "#{actor_1.name} runs from #{actor_2.name}."
    elsif attack_type=="item"
    end
  end

  def fighting_sword(actor_1, actor_2)
    attack_d20=(rand 1..20)
    defend_d20=(rand 1..20)
    # puts "#{actor_1.name} rolled #{attack_d20} to hit!"
    # puts "#{actor_2.name} rolled #{defend_d20} to dodge!"
    # puts
    if attack_d20==20
      puts "Critical Hit! "+"#{actor_1.name} swings for maximum damage!"
      damage=actor_1.equipped_melee_weapon.max_damage+((actor_1.strength)/2-5.floor)
      bonus_damage=actor_1.equipped_melee_weapon.max_bonus_damage
      puts "#{damage} damage!"
      if bonus_damage!=0
        puts "... and #{bonus_damage} #{actor_1.equipped_melee_weapon.damage_type} damage!"
      end
      actor_2.health-=damage+bonus_damage
      actor_2.health=[actor_2.health, 0].max
      if actor_2.health==0
        actor_2.defeated(actor_1)
        actor_2.alive=false
      end
    elsif actor_1.strength+attack_d20+actor_1.equipped_melee_weapon.weapon_bonus>actor_2.dexterity+defend_d20
      puts "Hit! "+["#{actor_1.name} hit #{actor_2.name} with their #{actor_1.equipped_melee_weapon.name}!", "#{actor_1.name} stabs #{actor_2.name}!", "#{actor_2.name} gets sliced across the chest by #{actor_1.name}'s #{actor_1.equipped_melee_weapon.name}"].sample
      damage=(actor_1.equipped_melee_weapon.attack)+((actor_1.strength)/2-5.floor)
      bonus_damage=actor_1.equipped_melee_weapon.attack_bonus
      puts "#{damage} damage!"
      if bonus_damage!=0
        puts "... and #{bonus_damage} #{actor_1.equipped_melee_weapon.damage_type} damage!"
      end
      actor_2.health-=damage+bonus_damage
      actor_2.health=[actor_2.health, 0].max
      if actor_2.health==0
        actor_2.defeated(actor_1)
        actor_2.alive=false
      end
    else
    puts "Miss! "+["#{actor_1.name} misses #{actor_2.name} with a wide slice!", "#{actor_2.name} narrowly dodges #{actor_1.name}'s blow!", "#{actor_1.name} lunges at #{actor_2.name}, but #{actor_2.name} escapes the blow!"].sample
    end
  end

  def fighting_bow(actor_1, actor_2)
    attack_d20=(rand 1..20)
    defend_d20=(rand 1..20)
    # puts "#{actor_1.name} rolled #{attack_d20} to hit!"
    # puts "#{actor_2.name} rolled #{defend_d20} to dodge!"
    # sleep (0.5)
    # puts
    if attack_d20==20
      puts "Critical Hit! "+"#{actor_1.name} shoots for maximum damage!"
      damage=actor_1.equipped_ranged_weapon.max_damage+((actor_1.dexterity)/2-5.floor)
      bonus_damage=actor_1.equipped_ranged_weapon.max_bonus_damage
      puts "#{damage} damage!"
      if bonus_damage!=0
        puts "... and #{bonus_damage} #{actor_1.equipped_ranged_weapon.damage_type} damage!"
      end
      actor_2.health-=damage+bonus_damage
      actor_2.health=[actor_2.health, 0].max
      if actor_2.health==0
        actor_2.defeated(actor_1)
        actor_2.alive=false
      end
    elsif actor_1.dexterity+attack_d20+actor_1.equipped_ranged_weapon.weapon_bonus>actor_2.dexterity+defend_d20
      puts "Hit! "+["#{actor_1.name} hits #{actor_2.name} with a loosed arrow", "#{actor_1.name} pulls an arrow from his quiver and delivers it into #{actor_2.name}!", "#{actor_2.name} takes an arrow to the leg!"].sample
      damage=actor_1.equipped_ranged_weapon.attack+((actor_1.dexterity)/2-5.floor)
      bonus_damage=actor_1.equipped_ranged_weapon.attack_bonus
      puts "#{damage} damage!"
      if bonus_damage!=0
          puts "... and #{bonus_damage} #{actor_1.equipped_ranged_weapon.damage_type} damage!"
      end
      actor_2.health-=damage+bonus_damage
      actor_2.health=[actor_2.health, 0].max
      if actor_2.health==0
        actor_2.defeated(actor_1)
        actor_2.alive=false
      end
    else
    puts "Miss! "+["#{actor_1.name} misses #{actor_2.name} with an errant arrow!", "#{actor_2.name} narrowly dodges #{actor_1.name}'s shot!", "#{actor_1.name} looses an arrow at #{actor_2.name}, but #{actor_2.name} rolls to saftey!"].sample
    end
  end

  def fighting_spell(actor_1, actor_2)
    attack_d20=(rand 1..20)
    defend_d20=(rand 1..20)
    # puts "#{actor_1.name} rolled #{attack_d20} to hit!"
    # puts "#{actor_2.name} rolled #{defend_d20} to dodge!"
    # sleep (0.5)
    # puts
    if attack_d20==20
      puts "Critical Hit! "+"#{actor_1.name} casts for maximum damage!"
        damage=actor_1.equipped_spell.max_damage+((actor_1.wisdom)/2-5.floor)
        bonus_damage=actor_1.equipped_spell.max_bonus_damage
        puts "#{damage} damage!"
      if bonus_damage!=0
        puts "... and #{bonus_damage} #{actor_1.equipped_spell.damage_type} damage!"
      end
      actor_2.health-=damage+bonus_damage
      actor_2.health=[actor_2.health, 0].max
      if actor_2.health==0
        actor_2.defeated(actor_1)
        actor_2.alive=false
      end
    elsif actor_1.wisdom+attack_d20+actor_1.equipped_spell.weapon_bonus>actor_2.dexterity+defend_d20
      puts "Hit! "+["#{actor_1.name} buffets #{actor_2.name} with #{actor_1.equipped_spell.name}!", "#{actor_1.name} chants a powerful incantation! #{actor_1.equipped_spell.name}!", "With a wave of their hand, #{actor_1.name} blasts #{actor_2.name} with #{actor_1.equipped_spell.name}!"].sample
      damage=actor_1.equipped_spell.attack+((actor_1.wisdom)/2-5.floor)
      bonus_damage=actor_1.equipped_spell.attack_bonus
      puts "#{damage} damage!"
      if bonus_damage!=0
        puts "... and #{bonus_damage} #{actor_1.equipped_spell.damage_type} damage!"
      end
        actor_2.health-=damage+bonus_damage
        actor_2.health=[actor_2.health, 0].max
      if actor_2.health==0
        actor_2.defeated(actor_1)
        actor_2.alive=false
      end
    else
      puts "Miss! "+["#{actor_1.name} misses #{actor_2.name} with #{actor_1.equipped_spell.name}!", "#{actor_2.name} jumps over #{actor_1.name}'s cast!", "#{actor_1.name} says the wrong incantation! Rather than #{actor_1.equipped_spell.name}, #{actor_2.name} is hit with bread!"].sample
    end
  end

end
