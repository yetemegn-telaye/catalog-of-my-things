require_relative 'app'

app = App.new
app.load_all

def show_options
  puts "\nSelect an option from the following:"
  puts '1- List all books'
  puts '2- List all music albums'
  puts '3- List all movies'
  puts '4- List of games'
  puts '5- List all genres'
  puts '6- List all labels'
  puts '7- List all authors'
  puts '8- all sources'
  puts '9- Add a book'
  puts '10- Add a music album'
  puts '11- Add a movie'
  puts '12- Add a game'
  puts '13- Exit'
end

loop do
  show_options
  option = gets.chomp

  case option
  when '1'
    app.list_books
  when '4'
    app.list_games
  when '6'
    app.list_labels
  when '7'
    app.list_authors
  when '9'
    app.add_book
  when '12'
    app.add_game
  when '13'
    app.save_all
    puts 'Thanks for using this app!'
    exit
  else
    puts 'Invalid option. Please try again.'
  end
end
