class Genre
  attr_accessor :name
  attr_reader :id

  def initialize(name)
    @id = rand(1..200)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self)
  end

  def to_h
    {
      id: @id,
      name: @name
    }
  end
end
