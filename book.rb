require 'date'
require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label, :title

  def initialize(title, publish_date, publisher, cover_state)
    super(publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_h
    {
      'type' => 'book',
      'title' => @title,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date
    }
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
