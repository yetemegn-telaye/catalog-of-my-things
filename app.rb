require_relative 'label'
require_relative 'book'

class App
  attr_reader :labels, :books

  def initialize
    @labels = []
    @books = []
  end

  def list_books
    puts
    puts 'Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Publisher: #{book.publisher},
      Cover State: #{book.cover_state}, Published: #{book.publish_date},
      Archived: #{book.archived || (book.cover_state == 'bad')}"
    end
    puts
  end

  def list_labels
    puts
    puts 'Labels:'
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
      puts 'Items:'
      label.items.each do |item|
        puts "#{item.class}: #{item.title}"
      end
    end
    puts
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts 'Enter cover state (good/bad):'
    cover_state = gets.chomp.downcase == 'bad'
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter author:'
    author = gets.chomp
    puts 'Enter label title:'
    label_title = gets.chomp
    puts 'Enter label color:'
    label_color = gets.chomp
    book = Book.new(title, publish_date, publisher, cover_state)
    book.add_author(author)
    @books << book
    label = add_label(label_title, label_color)
    label.add_item(book)
    book
  end

  def add_label(title, color)
    label = Label.new(title, color)
    @labels << label
    label
  end
end
