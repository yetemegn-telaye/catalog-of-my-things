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
    "[Game][author: #{author}] multiplayer: #{@multiplayer} last_played_at: #{last_played_at}"
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
    Author.show_list
    index = gets.chomp.to_i
    list_author = Author.all
    return if index < 0 || index > list_author.length
    author = list_author[index]
    author.add_item(self)

    # todo
    # choose genre
    # choose label
    # choose source

    print "Publication date: "
    publish_date = gets.chomp

    print "Multiplayer [Y, N]: "
    value = gets.chomp.to_s.upcase
    multiplayer = false
    multiplayer = true if value == "Y"

    print "Last Played at: "
    last_played_at = gets.chomp

    game = new(publish_date, multiplayer, last_played_at)
    game.add_author(author)
    puts "Game created succcessfully!"
    game
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end

  def self.save_all
    return false if !File.exist?("./data/game.json")
    list = []
    all.each do |game|
      #how to save the authors, the labels, the genre etc...
      data = { id: game.id, author_id: game.author.id,
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
    return false if File.read("./data/game.json").empty?
    list = JSON.parse(File.read("./data/game.json"))
    list.each do |data|
      game = new(data["publish_date"], data["multiplayer"], data["last_played_at"], data["id"])
      
      # add authors
      game_author = Author.all.find { |author| author.id == data["author_id"]}
      game_author&.add_item(game)
      game&.add_author(game_author)

      # todo
      # add label
      # add source
      # add genre
    end
  end

end