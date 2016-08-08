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
      self.health=rand(1..3)
      self.name="Lowly Skeleton".red
      self.exp_given=100
      self.equipped_melee_weapon=BasicWeapon.new("longsword", "melee")
      self.equipped_ranged_weapon=BasicWeapon.new("shortbow", "ranged")
      self.loot_pool=easy_loot_pool
    # elsif self.type=="medium"
    # elsif self.type=="hard"
    end
  end

  def drop_loot
    self.loot_pool.sample
  end
end
