require "json"
class Author
  attr_accessor :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name, id = rand(0..100))
    @id = id
    @first_name = first_name
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

  def self.show_list
    return puts "No authors available" if all.empty? 
    all.each_with_index do |author, index|
      puts "#{index}] #{author}" #.first_name} #{author.last_name}"
    end
  end

  def self.create
    puts "\nSelect the author information"
    print "First Name: "
    first_name = gets.chomp.to_s

    print "Last Name: "
    last_name = gets.chomp.to_s

    puts "Author created succcessfully!"
    author = new(first_name, last_name)
  end

  def self.save_all
    if File.exist?("./data/authors.json")
      list = []
      all.each do |author|
        list << {id: author.id, first_name: author.first_name, last_name: author.last_name }
      end 
      File.write("./data/authors.json", JSON.pretty_generate(list))
    end
  end
  def self.load_all
    return false if !File.exist?('./data/authors.json')
    return false if File.read("./data/authors.json").empty?
    list_authors = JSON.parse(File.read("./data/authors.json"))
    list_authors.each do |author|
      new(author["first_name"], author["last_name"], author["id"])
    end
  end
end