class Enemy
  attr_accessor :type, :strength, :dexterity, :health, :wisdom, :alive, :inventory

  def initialize
    self.alive=true
  end
end