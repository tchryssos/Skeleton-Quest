require_relative "../enemy.rb"
require_relative "../../../utilities/environment.rb"
require 'pry'

class Skeleton<Enemy

  def initialize(type)
    super
    @type=type
    roll_skeleton_stats
    @talk=["'Nyeh!'", "You hear the creaking of bones", "The skeleton hums a little tune.", "'Mweah!'", "The skeleton rattles aggressively.", "The skeleton ties a cute bow around its wrist. It looks at you inquisitively. Then it unties the bow."]
  end

  def roll_skeleton_stats
    if self.type=="easy"
      self.strength = 10+[rand(2..6), rand(2..6)].max
      self.dexterity = 12+[rand(2..6), rand(2..6)].max
      self.wisdom = 9+[rand(2..5), rand(2..5)].max
      self.health=rand(1..4)
      self.name="Lowly Skeleton".red
    # elsif self.type=="medium"
    # elsif self.type=="hard"
    end
  end
end
