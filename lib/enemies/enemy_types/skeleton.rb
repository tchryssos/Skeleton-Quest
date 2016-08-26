require_relative "../enemy.rb"
require_relative "../../../utilities/environment.rb"
require 'pry'

class Skeleton<Enemy

  attr_accessor :boss

[{name: "Strength", value: @strength},{name:"Dexterity", value:@dexterity}, {name: "Wisdom", value:@wisdom}]


  def initialize(type)
    super
    @type=type
    roll_skeleton_stats
    @talk=["'Nyeh!'", "You hear the creaking of bones", "The skeleton hums a little tune.", "'Mweah!'", "The skeleton rattles aggressively.", "The skeleton ties a cute bow around its wrist. It looks at you inquisitively. Then it unties the bow."]
  end

  def roll_skeleton_stats
    if self.type=="easy"
      self.strength = 10+[rand(2..4), rand(2..4)].max
      self.dexterity = 12+[rand(2..6), rand(2..6)].max
      self.wisdom = 9+[rand(2..5), rand(2..5)].max
      self.health=rand(1..3)
      self.name="Lowly Skeleton".red
      self.exp_given=100
      self.equipped_melee_weapon=BasicWeapon.new("longsword", "melee")
      self.equipped_ranged_weapon=BasicWeapon.new("shortbow", "ranged")
      self.equipped_spell=BasicWeapon.new("basic spell", "spell")
      self.loot_pool=easy_loot_pool
    elsif self.type=="medium"
      self.strength = 10+rand(3..5)
      self.dexterity = 10+[rand(3..5), rand(3..5)].max
      self.wisdom = 9+[rand(2..5), rand(2..5)].max
      self.health=rand(20..25)
      self.name="Spooky Skeleton".red
      self.exp_given=200
      self.equipped_melee_weapon=MagicWeapon.new("Spook-Spear", "melee")
      self.equipped_ranged_weapon=MagicWeapon.new("Creepy Bow", "ranged")
      self.equipped_spell=MagicWeapon.new("Toot Toot", "spell")
      self.loot_pool=medium_loot_pool
    elsif self.type=="hard"
      self.boss=true
      self.strength = 10+rand(3..5)
      self.dexterity = 12+[rand(3..5), rand(3..5)].max
      self.wisdom = 13+[rand(4..6), rand(4..6)].max
      self.health=rand(30..40)
      self.name="Skeleton Lord".red
      self.exp_given=400
      self.equipped_melee_weapon=LegendaryWeapon.new("Axe of Skeletal Might", "melee")
      self.equipped_ranged_weapon=LegendaryWeapon.new("Crulby Spirit, Crossbow Form", "ranged")
      self.equipped_spell=LegendaryWeapon.new("Very Spooky Fireball", "spell")
      self.loot_pool=easy_loot_pool
    end
  end

  def drop_loot
    self.loot_pool.sample
  end

end
