require_relative "../../utilities/environment"

class Enemy
  attr_accessor :type, :strength, :dexterity, :health, :wisdom, :alive, :inventory, :talk, :name

  def initialize(type)
    self.alive=true
    self.inventory=[]
  end

  def enemy_stats
    puts "#{self.name.to_s.upcase}'S STATS"
    puts "Health: #{@health}"
    puts "Strength: #{@strength}"
    puts "Dexterity: #{@dexterity}"
    puts "Wisdom: #{@wisdom}"
  end

  def enemy_talk
    puts self.talk.sample
  end
  def defeated
    puts "You defeated #{self.name}!"
    character.level+=1
  end
end
