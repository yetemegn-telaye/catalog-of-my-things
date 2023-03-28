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
    "#{super} multiplayer: #{@multiplayer} last_played_at: #{last_played_at}"
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

    print "Publication date: "
    @publish_date = gets.chomp

    print "Multiplayer [Y, N]: "
    multiplayer = gets.chomp
    @multiplayer = true if multiplayer.upcase == "Y"
    @multiplayer = false if multiplayer.upcase == "N"
    return puts "Invalid option (Only 'Y' and 'N')" if multiplayer.upcase != "Y" && multiplayer.upcase != "N"

    print "Last Played at: "
    @last_played_at = gets.chomp
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end

end