require '../item'

describe Item do
  before(:all) do
    @item = Item.new('2000-01-03')
  end
  context 'test item basic method' do
    it '#initialize' do
      expect(@item.id).to be_kind_of Integer
      expect(@item.publish_date).to eq '2000-01-03'
      expect(@item.archived).to eq false
    end

    it '#move_to_archive' do
      @item.move_to_archive
      expect(@item.archived).to eq true
    end
  end

  context '#add_item' do
    it 'add_author' do
      author = Author.new('Dicko', 'Allassane')
      @item.add_author(author)
      expect(@item.author).to eq author
    end
    it 'add_genre' do
      genre = Genre.new('Rock')
      @item.add_genre(genre)
      expect(@item.genre).to eq genre
    end
    it 'add_label' do
      label = Label.new('Fiction', 'blue')
      @item.add_label(label)
      expect(@item.label).to eq label
    end
  end
end
