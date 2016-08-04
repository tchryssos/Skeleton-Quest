require_relative "../classes/knight.rb"
require_relative "../classes/thief.rb"
require_relative "../classes/wizard.rb"
require_relative "../utilities/environment"
require_relative "../utilities/fighting.rb"
require 'pry'

class Character
  attr_accessor :level, :strength, :dexterity, :health, :max_health, :wisdom, :experience, :class, :name, :alive
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
    puts "Health: #{@health}/#{@max_health}"
    puts "Strength: #{@strength}"
    puts "Dexterity: #{@dexterity}"
    puts "Wisdom: #{@wisdom}"
  end

end

mobin=Character.new
mobin.strength=16
mobin.dexterity=10
mobin.health=20
mobin.name="Mobin"

jangles=Character.new
jangles.strength=14
jangles.health=15
jangles.dexterity=15
jangles.name="Jangles"

binding.pry
