require '../author'

describe Author do
  context "#show_list" do
    it "#show_list: empty" do
      puts Author.show_list
      expect(Author.show_list).to eq (puts 'No authors available')
    end
  end

  context "test author basic method" do
    before(:all) do
      @author = Author.new("Dicko", "Allassane")
      @game = Game.new("2000", false, "2010")
    end
    it "#initialize" do
      expect(@author.id).to be_kind_of Integer
      expect(@author.first_name).to eq "Dicko"
      expect(@author.last_name).to eq "Allassane"
    end

    it "#to_s" do
      expect("#{@author}").to eq "Dicko Allassane"
    end

    it "Author.all" do
      expect(Author.all).to contain_exactly(@author)
      author2 = Author.new("Trast", "trast00")
      expect(Author.all).to contain_exactly(@author, author2)
    end
  end

  context "#add_item" do
    before(:all) do
      @author = Author.new("Dicko", "Allassane")
      @game = Game.new("2000", false, "2010")
    end
    it "empty list of item" do
      expect(@author.items).to eq []
    end

    it "empty list of item" do
      @author.add_item(@game)
      expect(@author.items).to eq [@game]
    end
  end

end
