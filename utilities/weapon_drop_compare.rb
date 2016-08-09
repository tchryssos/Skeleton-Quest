require_relative 'environment'

def melee_weapon_drop_compare(dungeon_room, drop)
  damage_compare=melee_weapon_damage_compare(dungeon_room, drop)
  bd_compare=melee_weapon_bonus_damage_compare(dungeon_room,drop)
  cth_compare=melee_weapon_attack_bonus_compare(dungeon_room,drop)
  puts "#{drop.name}"
  puts "Type: #{drop.weapon_type}"
  puts "Damage: #{drop.weapon_damage}"+" #{damage_compare}"
  puts "Bonus Damage: #{drop.weapon_bonus_damage}"+" #{bd_compare}"
  puts "Bonus Chance to Hit: #{drop.weapon_bonus}"+" #{cth_compare}"
end

    def melee_weapon_damage_compare(dungeon_room, drop)
      player_sword=dungeon_room.character.equipped_melee_weapon
      if drop.max_damage>player_sword.max_damage
        "+".green
      elsif drop.max_damage<player_sword.max_damage
        "-".red
      end
    end

    def melee_weapon_bonus_damage_compare(dungeon_room,drop)
      player_sword=dungeon_room.character.equipped_melee_weapon
      if drop.max_bonus_damage>player_sword.max_bonus_damage
        "+".green
      elsif drop.max_bonus_damage<player_sword.max_bonus_damage
        "-".red
      end
    end

    def melee_weapon_attack_bonus_compare(dungeon_room,drop)
      player_sword=dungeon_room.character.equipped_melee_weapon
      if drop.weapon_bonus>player_sword.weapon_bonus
        "+".green
      elsif drop.weapon_bonus<player_sword.weapon_bonus
        "-".red
      end
    end

def ranged_weapon_drop_compare(dungeon_room, drop)
  damage_compare=ranged_weapon_damage_compare(dungeon_room, drop)
  bd_compare=ranged_weapon_bonus_damage_compare(dungeon_room,drop)
  cth_compare=ranged_weapon_attack_bonus_compare(dungeon_room,drop)
  puts "#{drop.name}"
  puts "Type: #{drop.weapon_type}"
  puts "Damage: #{drop.weapon_damage}"+" #{damage_compare}"
  puts "Bonus Damage: #{drop.weapon_bonus_damage}"+" #{bd_compare}"
  puts "Bonus Chance to Hit: #{drop.weapon_bonus}"+" #{cth_compare}"
end

    def ranged_weapon_damage_compare(dungeon_room, drop)
      player_bow=dungeon_room.character.equipped_ranged_weapon
      if drop.max_damage>player_bow.max_damage
        "+".green
      elsif drop.max_damage<player_bow.max_damage
        "-".red
      end
    end

    def ranged_weapon_bonus_damage_compare(dungeon_room, drop)
      player_bow=dungeon_room.character.equipped_ranged_weapon
      if drop.max_bonus_damage>player_bow.max_bonus_damage
        "+".green
      elsif drop.max_bonus_damage<player_bow.max_bonus_damage
        "-".red
      end
    end

    def ranged_weapon_attack_bonus_compare(dungeon_room, drop)
      player_bow=dungeon_room.character.equipped_ranged_weapon
      if drop.weapon_bonus>player_bow.weapon_bonus
        "+".green
      elsif drop.weapon_bonus<player_bow.weapon_bonus
        "-".red
      end
    end

def spell_drop_compare(dungeon_room, drop)
  damage_compare=spell_damage_compare(dungeon_room, drop)
  bd_compare=spell_bonus_damage_compare(dungeon_room,drop)
  cth_compare=spell_attack_bonus_compare(dungeon_room,drop)
  puts "#{drop.name}"
  puts "Type: #{drop.weapon_type}"
  puts "Damage: #{drop.weapon_damage}"+" #{damage_compare}"
  puts "Bonus Damage: #{drop.weapon_bonus_damage}"+" #{bd_compare}"
  puts "Bonus Chance to Hit: #{drop.weapon_bonus}"+" #{cth_compare}"
end

    def spell_damage_compare(dungeon_room, drop)
      player_spell=dungeon_room.character.equipped_spell
      if drop.max_damage>player_spell.max_damage
        "+".green
      elsif drop.max_damage<player_spell.max_damage
        "-".red
      end
    end

    def spell_bonus_damage_compare(dungeon_room, drop)
      player_spell=dungeon_room.character.equipped_spell
      if drop.max_bonus_damage>player_spell.max_bonus_damage
        "+".green
      elsif drop.max_bonus_damage<player_spell.max_bonus_damage
        "-".red
      end
    end

    def spell_attack_bonus_compare(dungeon_room, drop)
      player_spell=dungeon_room.character.equipped_spell
      if drop.weapon_bonus>player_spell.weapon_bonus
        "+".green
      elsif drop.weapon_bonus<player_spell.weapon_bonus
        "-".red
      end
    end
