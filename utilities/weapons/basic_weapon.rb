require_relative './weapon.rb'

class BasicWeapon<Weapon

  def initialize(name, weapon_type)
    super
    @weapon_damage="1d8"
    @max_damage=8
    @weapon_attack_bonus="None"
    @weapon_bonus_damage="None"
    @max_bonus_damage=0
  end

  def attack
    rand(1..8)
  end

  def weapon_bonus
    0
  end

  def attack_bonus
    0
  end

end
