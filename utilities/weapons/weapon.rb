require_relative '../item.rb'

class Weapon<Item

  @@all=[]

  def initialize(name)
    @name=name
    @@all<<self
  end

  def equip_melee(character)
    character.equipped_melee_weapon=self
  end

  def equip_ranged(character)
    character.equipped_ranged_weapon=self
  end

  def equip_spell(character)
    character.equipped_spell=self
  end

end
