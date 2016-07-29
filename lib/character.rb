require_relative "../classes/knight.rb"
require_relative "../classes/thief.rb"
require_relative "../classes/wizard.rb"
require 'pry'

class Character
  attr_accessor :strength, :dexterity, :health, :wisdom, :experience, :class, :name, :alive

  def initialize
    @alive=true
  end

  def character_class
    if @class=="knight"
      char_knight=Knight.new
      @strength=char_knight.strength
      @wisdom=char_knight.wisdom
      @dexterity=char_knight.dexterity
      @health=char_knight.health
    elsif @class=="wizard"
      char_wiz=Wizard.new
      @strength=char_wiz.strength
      @wisdom=char_wiz.wisdom
      @dexterity=char_wiz.dexterity
      @health=char_wiz.health
    elsif @class =="thief"
      char_thief=Thief.new
      @strength=char_thief.strength
      @wisdom=char_thief.wisdom
      @dexterity=char_thief.dexterity
      @health=char_thief.health
    end
  end

  def stats
    puts "#{@name.upcase}'S STATS"
    puts "Health: #{@health}"
    puts "Strength: #{@strength}"
    puts "Dexterity: #{@dexterity}"
    puts "Wisdom: #{@wisdom}"
  end

end