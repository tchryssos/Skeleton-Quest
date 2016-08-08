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

  def defeated(who_defeated)
    puts "#{self.name} has died!"
    who_defeated.experience_gain(self.exp_given)
    puts
  end

  def easy_loot_pool
    [MagicWeapon.new("Skele-Shatter", "melee"), nil, MagicWeapon.new("Boneshooter","ranged"), nil, MagicWeapon.new("Magic Blast", "spell")]
  end
end
