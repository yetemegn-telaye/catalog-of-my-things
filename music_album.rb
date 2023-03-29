require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title, :genre

  def initialize(title, on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
    @title = title
    @genre = genre
  end

  def can_be_archived?
    super && @on_spotify
  end
end
