require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(params)
    super(params[:id], params[:genre], params[:author],
    params[:source], params[:label],
    params[:publish_date], params[:archived])
    @publisher = params[:publisher]
    @cover_state = params[:cover_state]
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
