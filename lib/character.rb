require_relative "../classes/knight.rb"
require_relative "../classes/thief.rb"
require_relative "../classes/wizard.rb"
require_relative "../utilities/environment"
require_relative "../utilities/fighting.rb"
require 'pry'

class Character
  attr_accessor :level, :strength, :dexterity, :health, :max_health, :wisdom, :experience, :class, :name, :alive, :current_experience, :max_experience, :inventory, :equipped_ranged_weapon, :equipped_melee_weapon, :equipped_spell
  include Fighting

  def initialize
    @alive=true
    @level=1
    @current_experience=0
    @max_experience=100
    @inventory=[]
    @equipped_melee_weapon=BasicWeapon.new("basic longsword", "melee")
    @equipped_ranged_weapon=BasicWeapon.new("basic shortbow", "ranged")
    @equipped_spell=BasicWeapon.new("basic spell", "spell")
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
    puts
    puts "#{name.upcase}'S INVENTORY"
    puts "Melee Weapon: " + "#{self.equipped_melee_weapon.name}"
    puts "Ranged Weapon: " + "#{self.equipped_ranged_weapon.name}"
    puts "Current Spell: " + "#{self.equipped_spell.name}"
  end

  def experience_gain(experience_amount)
    puts "#{self.name} gained #{experience_amount} experience!"
    self.current_experience+=experience_amount
    if self.current_experience >= self.max_experience
      level_up
      self.max_experience=max_experience*2
    end
  end

  def level_up
    self.level+=1
    puts "#{self.name} reached level #{self.level}!"
    sleep(1)
    puts
    puts "Type 'strength','dexterity', or 'wisdom' to upgrade that stat, \nor type 'health' to gain hitpoints. \nYou can also type 'stats' to see current stats."
    puts "->".yellow
    level_up_choice=gets.strip
    level_up_stats(level_up_choice)
    self.health=self.max_health
  end

  def level_up_stats(level_up_choice)
    if level_up_choice.downcase == 'strength'
      self.strength+=2
      puts
      puts "#{self.name}'s Strength increased!"
    elsif level_up_choice.downcase == 'dexterity'
      self.dexterity+=2
      puts
      puts "#{self.name}'s Dexterity increased!"
    elsif level_up_choice.downcase == 'wisdom'
      self.wisdom+=2
      puts
      puts "#{self.name}'s Wisdom increased!"
    elsif level_up_choice.downcase == 'health'
      self.max_health+=5
      puts
      puts "#{self.name} gained hitpoints!"
    elsif level_up_choice.downcase == 'stats'
      self.stats
      puts
      puts "Type 'strength','dexterity', or 'wisdom' to upgrade that stat, \nor type 'health' to gain hitpoints. \nYou can also type 'stats' to see current stats."
      puts
      level_up_choice=gets.strip
      level_up_stats(level_up_choice)
    else
      puts "Sorry! That's not a stat."
      puts "Type 'strength','dexterity', or 'wisdom' to upgrade that stat, \nor type 'health' to gain hitpoints. \nYou can also type 'stats' to see current stats."
      puts
      level_up_choice=gets.strip
      level_up_stats(level_up_choice)
    end
  end

    def defeated(who_defeated)
      puts "#{self.name} has died!"
      sleep(1)
    end

end
