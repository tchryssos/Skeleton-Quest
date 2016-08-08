require_relative './weapon.rb'

class BasicWeapon<Weapon
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
