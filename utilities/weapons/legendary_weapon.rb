require_relative "./weapon"
require 'colorize'

class LegendaryWeapon<Weapon

  def initialize(name, weapon_type)
    super
    @damage_type=["poison".magenta, "acid".green, "darkness".black].sample
    @weapon_type=weapon_type
    @weapon_damage="2d6"
    @max_damage=12
    @weapon_bonus_damage="1d4 #{self.damage_type}"
    @max_bonus_damage=3
    @weapon_attack_bonus="+4"
  end

  def attack
    rand(1..6)+rand(1..6)
  end

  def attack_bonus
    rand(1..5)
  end

  def weapon_bonus
    4
  end

end
