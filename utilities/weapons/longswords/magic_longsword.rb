require_relative "../weapon"

class MagicLongsword<Weapon

  attr_accessor :damage_type

  def initialize(name)
    super
    @damage_type=["frost", "fire", "shock"].sample
  end

  def attack
    dam=rand(1..8)
    puts "#{dam} damage!"
    dam
  end

  def attack_bonus
    dam=rand(1..3)
    puts "... and #{dam} #{self.damage_type} damage!"
    dam
  end

  def weapon_bonus
    2
  end

end
