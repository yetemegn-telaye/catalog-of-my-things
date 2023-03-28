require 'json'
require './item'
class Game < Item
  attr_reader :id
  attr_accessor :multiplayer, :last_played_at
  def initialize(publish_date, multiplayer, last_played_at, id = rand(0..100))
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @id = id
  end

  def to_s
    "#{super} [author: #{author}] multiplayer: #{@multiplayer} last_played_at: #{last_played_at}"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.show_list
    return puts "No game available" if all.empty? 
    all.each_with_index do |game, index|
      puts "#{index}] #{game}"
    end
  end

  def self.create
    puts "\nSelect the Game information"

    # Choose author
    puts "Select the author by index (not id):"
    @author.show_list
    index = gets.chomp
    author = @author.all[index]
    author.add_item(self)
    add_author(author)

    # todo
    # choose genre
    # choose label
    # choose source

    print "Publication date: "
    @publish_date = gets.chomp

    print "Multiplayer [Y, N]: "
    multiplayer = gets.chomp.to_s.upcase
    @multiplayer = true if multiplayer == "Y"
    @multiplayer = false if multiplayer == "N"
    return puts "Invalid option (Only 'Y' and 'N')" if multiplayer.upcase != "Y" && multiplayer.upcase != "N"

    print "Last Played at: "
    @last_played_at = gets.chomp
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end

  def self.save_all
    return false if !File.exist?("./data/game.json")
    list = []
    all.each do |game|
      #how to save the authors, the labels, the genre etc...
      data = { id: game.id, author_id: @author&.id,
        #source_id: @source&.id, label_id: @label&.id, genre_id: @genre.id, 
        multiplayer: game.multiplayer, last_played_at: game.last_played_at 
      }
      list << data
    end 
    File.write("./data/game.json", JSON.pretty_generate(list))
    true
  end

  def self.load_all
    return false if !File.exist?('./data/game.json')
    list = JSON.parse(File.read("./data/game.json"))
    list.each do |data|
      game = new(data["publish_date"], data["multiplayer"], data["last_played_at"], data["id"])
      
      # add authors
      game_author = Author.all.find { |author| author.id = data["author_id"]}
      game_author.add_item(game)
      game.add_author(game_author)

      # todo
      # add label
      # add source
      # add genre
    end
  end

end