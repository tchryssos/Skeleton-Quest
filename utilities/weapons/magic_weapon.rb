require_relative "./weapon"
require 'colorize'

class MagicWeapon<Weapon

  def initialize(name, weapon_type)
    super
    @damage_type=["frost".light_blue, "fire".light_red, "shock".light_yellow].sample
    @weapon_type=weapon_type
    @weapon_damage="1d8"
    @max_damage=8
    @weapon_bonus_damage="1d3 #{self.damage_type}"
    @max_bonus_damage=3
    @weapon_attack_bonus="+2"
  end

  def attack
    rand(1..8)
  end

  def attack_bonus
    rand(1..3)
  end

  def weapon_bonus
    2
  end

end
