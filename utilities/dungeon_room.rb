require_relative "../utilities/environment"

class DungeonRoom

  attr_accessor :enemy, :enemies, :character

  def initialize(character)
    @enemies=[]
    self.character=character
    self.enemy=roll_enemy
  end

  def roll_enemy
    case self.character.level
      when 1
        Skeleton.new("easy")
      when 2
        Skeleton.new("medium")
      when 3
        Skeleton.new("hard")
    end
  end
end
