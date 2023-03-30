require './author'
require './game'

describe Game do
  context '#show_list' do
    it '#show_list: empty' do
      puts Game.show_list
      expect(Game.show_list).to eq(puts('No game available'))
    end
  end

  context 'test author basic method' do
    before(:all) do
      @game = Game.new('1999/02/02', false, '2010/02/02')
      @author = Author.new('Dicko', 'Allassane')
    end
    it '#initialize' do
      expect(@game.id).to be_kind_of Integer
      expect(@game.publish_date).to eq '1999/02/02'
      expect(@game.multiplayer).to eq false
      expect(@game.last_played_at).to eq '2010/02/02'
    end

    it '#add_author : of Item' do
      @game.add_author(@author)
      expect(@game.author).to be @author
    end

    it '#to_s' do
      expect(@game.to_s).to eq "[Game] Created by #{@author} [author], " \
                               "Publish at #{@game.publish_date}, " \
                               "Last played at #{@game.last_played_at} " \
                               "[multiplayer: #{@game.multiplayer}]"
    end

    it 'Game.all' do
      expect(Game.all).to contain_exactly(@game)
      game2 = Game.new('1999/02/01', false, '2010/02/01')
      expect(Game.all).to contain_exactly(@game, game2)
    end

    it '#can_be_archived' do
      expect(@game.can_be_archived?).to eq true
    end
  end

  context '#add_item' do
    before(:all) do
      @game = Game.new('1999/02/02', false, '2010/02/02')
      @author = Author.new('Dicko', 'Allassane')
    end
    it 'author list of item' do
      @author.add_item(@game)
      expect(@author.items).to eq [@game]
    end
  end
end
