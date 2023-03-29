require_relative 'app'

app = App.new

loop do
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

  option = gets.chomp
  case option
  # when '1'
  #   app.list_books
  # when '6'
  #   app.list_labels
  # when '9'
  #   app.add_book
  when '10'
    app.add_music_album
  when '2'
    app.list_all_music_albums
  when '5'
    app.list_all_genres
  when '13'
    puts 'Thanks for using this app!'
    app.close
    exit
  else
    puts 'Invalid option. Please try again.'
  end
end
