require_relative "../enemy.rb"

class Skeleton<Enemy

  def initialize(type)
    super
    @type=type
    roll_skeleton_stats
  end

  def roll_skeleton_stats
    if self.type=="easy"
      self.strength = 10+[rand(2..6), rand(2..6)].max
      self.dexterity = 12+[rand(2..6), rand(2..6)].max
      self.wisdom = 9+[rand(2..5), rand(2..5)].max
      self.health=rand(1..4)
    # elsif self.type=="medium"
    # elsif self.type=="hard"
    end
  end
end
