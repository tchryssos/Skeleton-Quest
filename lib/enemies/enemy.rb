# require_relative "../../utilities/environment"

class Enemy
  attr_accessor :type, :strength, :dexterity, :health, :wisdom, :alive, :inventory

  def initialize(type)
    self.alive=true
  end

  def enemy_stats
    puts "#{self.class.to_s.upcase}'S STATS"
    puts "Health: #{@health}"
    puts "Strength: #{@strength}"
    puts "Dexterity: #{@dexterity}"
    puts "Wisdom: #{@wisdom}"
  end
end