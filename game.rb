require 'json'
require './item'
require 'date'

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
    "[Game] Created by #{author} [author], " \
      "Publish at #{publish_date}, " \
      "Last played at #{last_played_at} " \
      "[multiplayer: #{multiplayer}]"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.show_list
    return puts 'No game available' if all.empty?

    all.each do |game|
      puts game
    end
  end

  def self.save_all
    return false unless File.exist?('./data/games.json')

    list = []
    all.each do |game|
      data = {
        id: game.id,
        author_id: game.author.id,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        publish_date: game.publish_date
      }
      list << data
    end
    File.write('./data/games.json', JSON.pretty_generate(list))
    true
  end

  def self.load_all
    return false unless File.exist?('./data/games.json')
    return false if File.empty?('./data/games.json')

    list = JSON.parse(File.read('./data/games.json'))
    list.each do |data|
      game = new(data['publish_date'], data['multiplayer'], data['last_played_at'], data['id'])
      # add authors
      game_author = Author.all.find { |author| author.id == data['author_id'] }
      game_author&.add_item(game)
      game&.add_author(game_author)
    end
  end

  def self.create
    puts "\nSelect the Game and Author information"

    # Choose author
    author = Author.create
    author.add_item(self)

    puts "\nSelect the Game information"
    print 'Publication date: '
    publish_date = gets.chomp

    print 'Multiplayer [Y, N]: '
    value = gets.chomp.to_s.upcase
    multiplayer = false
    multiplayer = true if value == 'Y'

    print 'Last Played at: '
    last_played_at = gets.chomp

    game = new(publish_date, multiplayer, last_played_at)
    game.add_author(author)
    puts 'Game and Author created succcessfully!'
    game
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end
end
