class Wizard
  attr_accessor :strength, :wisdom, :dexterity, :health

  def initialize
    wizard_stat_roll
  end

  # def stats
  #   puts "Health: #{@health}"
  #   puts "Strength: #{@strength}"
  #   puts "Dexterity: #{@dexterity}"
  #   puts "Wisdom: #{@wisdom}"
  # end

 ########

  private 

  def wizard_stat_roll
    self.strength=wizard_strength_roll
    self.wisdom=wizard_wisdom_roll
    self.dexterity=wizard_dexterity_roll
    self.health=wizard_health_roll
  end

  def wizard_strength_roll
    6+[rand(2..4),rand(2..4)].max
  end

  def wizard_wisdom_roll
    10+[rand(2..6),rand(2..6), rand(2..6)].max
  end

  def wizard_dexterity_roll
    9+[rand(2..4),rand(2..4)].max
  end

  def wizard_health_roll
    10+rand(10..12)
  end

end
