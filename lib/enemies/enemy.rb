require_relative "../../utilities/environment"

class Enemy
  attr_accessor :type, :strength, :dexterity, :health, :wisdom, :alive, :inventory, :talk, :weak_talk, :name, :exp_given, :equipped_melee_weapon, :equipped_spell, :equipped_ranged_weapon, :loot_pool
  include Fighting

  def initialize(type)
    self.alive=true
    self.inventory=[]
  end

  def enemy_stats
    puts "#{self.name.to_s.upcase}'S STATS"
    puts "Health: #{@health}"
    puts "Strength: #{@strength}"
    puts "Dexterity: #{@dexterity}"
    puts "Wisdom: #{@wisdom}"
  end

  def enemy_talk
    puts self.talk.sample
  end

  def enemy_low_health_talk
    puts "...".yellow
  end

  def defeated(who_defeated)
    puts "#{self.name} has died!"
    who_defeated.experience_gain(self.exp_given)
    puts
  end

  def easy_loot_pool
    [MagicWeapon.new("Skele-Shatter Mace", "melee"), MagicWeapon.new("Mr. Skelly's Bane", "melee"), nil, MagicWeapon.new("Boneshooter Bow","ranged"), MagicWeapon.new("The Creeper","ranged"), nil, MagicWeapon.new("Pryoblast", "spell"), MagicWeapon.new("Blizzard", "spell")]
  end

  def medium_loot_pool
    [LegendaryWeapon.new("Leg-Bone Hammer 1999", "melee"), LegendaryWeapon.new("Whip of Ghouls and Fiends II", "melee"), nil, LegendaryWeapon.new("Rick's Phantasmal Bow","ranged"), LegendaryWeapon.new("Cadaverous Knife-Flinger","ranged"),nil, LegendaryWeapon.new("GIANT SPOOKENING", "spell"),LegendaryWeapon.new("Ragnarock", "spell")]
  end

  def hard_loot_pool
    []
  end

  def sort_attributes
    [{name: "Strength", value: @strength},{name:"Dexterity", value:@dexterity}, {name: "Wisdom", value:@wisdom}].sort_by {|stat| stat[:value]}
  end
end
