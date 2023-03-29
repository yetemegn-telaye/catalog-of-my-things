require 'rspec'
require_relative '../label'
require_relative '../book'

describe Label do
  let(:title) { 'Fiction' }
  let(:color) { 'blue' }
  subject(:label) { described_class.new(title, color) }

  describe '#initialize' do
    it 'sets the title' do
      expect(label.title).to eq(title)
    end

    it 'sets the color' do
      expect(label.color).to eq(color)
    end

    it 'sets the items to an empty array' do
      expect(label.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:book_title) { 'To Kill a Mockingbird' }
    let(:publish_date) { '1960-07-11' }
    let(:publisher) { 'J. B. Lippincott & Co.' }
    let(:cover_state) { 'good' }
    let(:book) { Book.new(book_title, publish_date, publisher, cover_state) }

    it "adds an item to the label's items array" do
      label.add_item(book)
      expect(label.items).to include(book)
    end

    it "sets the item's label to the label" do
      label.add_item(book)
      expect(book.label).to eq(label)
    end
  end
end
