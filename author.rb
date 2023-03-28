
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

  def to_s
    "#{@first_name} #{last_name}"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.show_list_authors
    all.each_with_index do |author, index|
      puts "#{index}] #{@first_name} #{last_name}"
    end
  end

  def self.create
    puts "Select the author information"
    print "First Name: "
    first_name = gets.chomp.to_s

    print "Last Name: "
    last_name = gets.chomp.to_s

    new(first_name, last_name)
    puts "Author created succcessfully!"
  end
end