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

end