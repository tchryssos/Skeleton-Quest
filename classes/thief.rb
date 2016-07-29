class Thief
  attr_accessor :strength, :wisdom, :dexterity, :health

  def initialize
    thief_stat_roll
  end

  # def stats
  #   puts "Health: #{@health}"
  #   puts "Strength: #{@strength}"
  #   puts "Dexterity: #{@dexterity}"
  #   puts "Wisdom: #{@wisdom}"
  # end

 ########

  private 

  def thief_stat_roll
    self.strength=thief_strength_roll
    self.wisdom=thief_wisdom_roll
    self.dexterity=thief_dexterity_roll
    self.health=thief_health_roll
  end

  def thief_strength_roll
    9+[rand(2..4),rand(2..4)].max
  end

  def thief_wisdom_roll
    6+[rand(2..4),rand(2..4)].max
  end

  def thief_dexterity_roll
    10+[rand(2..6),rand(2..6), rand(2..6)].max
  end

  def thief_health_roll
    12+rand(8..12)
  end

end
