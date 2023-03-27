
class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(id, first_name, last_name)
    @id = id,
    @first_name = first_name,
    @last_name = last_name
    @items = []
  end
  
  def add_item(item)
    @items << item
  end
end