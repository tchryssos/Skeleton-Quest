class Knight
  attr_accessor :strength, :wisdom, :dexterity, :health

  def initialize
    knight_stat_roll
  end

  # def stats
  #   puts "Health: #{@health}"
  #   puts "Strength: #{@strength}"
  #   puts "Dexterity: #{@dexterity}"
  #   puts "Wisdom: #{@wisdom}"
  # end

 ########

  private 

  def knight_stat_roll
    self.strength=knight_strength_roll
    self.wisdom=knight_wisdom_roll
    self.dexterity=knight_dexterity_roll
    self.health=knight_health_roll
  end

  def knight_strength_roll
    10+[rand(2..6),rand(2..6), rand(2..6)].max
  end

  def knight_wisdom_roll
    6+[rand(2..4),rand(2..4)].max
  end

  def knight_dexterity_roll
    9+[rand(2..4),rand(2..4)].max
  end

  def knight_health_roll
    12+rand(10..14)
  end

end
