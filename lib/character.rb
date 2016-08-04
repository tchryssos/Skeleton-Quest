require_relative "../classes/knight.rb"
require_relative "../classes/thief.rb"
require_relative "../classes/wizard.rb"
require_relative "../utilities/environment"
require_relative "../utilities/fighting.rb"
require 'pry'

class Character
  attr_accessor :level, :strength, :dexterity, :health, :max_health, :wisdom, :experience, :class, :name, :alive, :current_experience, :max_experience
  include Fighting

  def initialize
    @alive=true
    @level=1
  end

  def character_class
    if @class=="knight"
      char_knight=Knight.new
      @strength=char_knight.strength
      @wisdom=char_knight.wisdom
      @dexterity=char_knight.dexterity
      @health=char_knight.health
      @max_health=char_knight.health
    elsif @class=="wizard"
      char_wiz=Wizard.new
      @strength=char_wiz.strength
      @wisdom=char_wiz.wisdom
      @dexterity=char_wiz.dexterity
      @health=char_wiz.health
      @max_health=char_wiz.health
    elsif @class =="thief"
      char_thief=Thief.new
      @strength=char_thief.strength
      @wisdom=char_thief.wisdom
      @dexterity=char_thief.dexterity
      @health=char_thief.health
      @max_health=char_thief.health
    end
  end

  def stats
    puts "#{@name.upcase}'S STATS"
    puts "Class: #{@class.capitalize}"
    puts "Level: #{self.level}"
    puts "Health: #{@health}/#{@max_health}"
    puts "Strength: #{@strength}"
    puts "Dexterity: #{@dexterity}"
    puts "Wisdom: #{@wisdom}"
  end

  def level_up
    self.level+=1
    puts "#{self.name} reached level #{self.level}!".yellow
  end
end
