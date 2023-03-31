class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color)
    @id = rand(1..100)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_h
    {
      'type' => 'label',
      'id' => @id,
      'title' => @title,
      'color' => @color
    }
  end
end
