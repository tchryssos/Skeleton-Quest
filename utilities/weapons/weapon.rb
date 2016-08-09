require_relative '../item.rb'

class Weapon<Item

  attr_accessor :damage_type, :weapon_type, :weapon_damage, :weapon_bonus_damage, :weapon_attack_bonus, :max_damage, :max_bonus_damage

  @@all=[]

  def initialize(name, weapon_type)
    @name=name
    @weapon_type=weapon_type
    @item_type="weapon"
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
