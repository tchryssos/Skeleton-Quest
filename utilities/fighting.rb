require_relative 'environment'
require 'colorize'

module Fighting

  ##allow fighting methods to take in damage ranges from actors##
  ##probably create weapon classes and give to each enemy/player and take damage ranges from those##

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

#### CREATE SEPARATE VARIABLES FOR MAIN DAMAGE AND DAMAGE BONUS, PUTS BOTH, CHANGE WEAPONS TO NOT PUTS ###

  def fighting_sword(actor_1, actor_2)
      if actor_1.strength+rand(1..20)+actor_1.equipped_melee_weapon.weapon_bonus>actor_2.dexterity+rand(1..20)
        puts "Hit! "+["#{actor_1.name} hit #{actor_2.name} with their #{actor_1.equipped_melee_weapon.name}!", "#{actor_1.name} stabs #{actor_2.name}!", "#{actor_2.name} gets sliced across the chest by #{actor_1.name}'s #{actor_1.equipped_melee_weapon.name}"].sample
        damage=actor_1.equipped_melee_weapon.attack + actor_1.equipped_spell.attack_bonus
        actor_2.health-=damage
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
    if actor_1.dexterity+rand(1..20)+actor_1.equipped_ranged_weapon.weapon_bonus>actor_2.dexterity+rand(1..20)
      puts "Hit! "+["#{actor_1.name} hits #{actor_2.name} with a loosed arrow", "#{actor_1.name} pulls an arrow from his quiver and delivers it into #{actor_2.name}!", "#{actor_2.name} takes an arrow to the leg!"].sample
      damage=actor_1.equipped_ranged_weapon.attack + actor_1.equipped_spell.attack_bonus
      actor_2.health-=damage
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
    if actor_1.wisdom+rand(1..20)+actor_1.equipped_spell.weapon_bonus>actor_2.dexterity+rand(1..20)
      puts "Hit! "+["#{actor_1.name} hit #{actor_2.name} with a conjured fireball!", "#{actor_1.name} summons boulders that rain onto #{actor_2.name}!", "#{actor_1.name} chants in a low voice, filling the room with toxic gas! #{actor_2.name} chokes!"].sample
      damage=actor_1.equipped_spell.attack + actor_1.equipped_spell.attack_bonus
      actor_2.health-=damage
      actor_2.health=[actor_2.health, 0].max
      if actor_2.health==0
        actor_2.defeated(actor_1)
        actor_2.alive=false
      end
    else
      puts "Miss! "+["#{actor_1.name} misses #{actor_2.name} with a water jet!", "#{actor_2.name} jumps over a summoned swarm of flaming rats!", "#{actor_1.name} says the wrong incantation! Rather than daggers, #{actor_2.name} is hit with bread!"].sample
    end
  end

end
