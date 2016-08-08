require_relative 'environment'

class Item

  attr_reader :name

  def initialize(name)
    @name=name
  end

  def get_item(character)
    character.inventory<<self
  end

end
