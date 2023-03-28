def show_list_options
  puts "\nSelect an option from the following: "
  puts '1- List all books'
  puts '2- List all music albums'
  puts '3- List all movies'
  puts '4- List of games'
  puts '5- List all genres'
  puts '6- List all labels'
  puts '7- List all authors'
  puts '8- List all sources'
  puts '9- Add a book'
  puts '10- Add a music album'
  puts '11- Add a movie'
  puts '12- Add a game'
  puts '13- Add a genre'
  puts '14- Add a author'
  puts '15- Add a source'
  puts '16- Add a label'
  puts '17- exit'
end

def open_option(option)
  list_option = {
    '1' => '@app.list_book1',
    '2' => '@app.list_music2',
    '3' => '@app.list_music3',
    '4' => '@app.list_music4',
    '5' => '@app.list_music5',
    '6' => '@app.list_music6',
    '7' => '@app.list_music7',
    '8' => '@app.list_music8',
    '9' => '@app.list_music9',
    '10' => '@app.list_music10',
    '11' => '@app.list_music11',
    '12' => '@app.list_music12',
    '13' => '@app.list_music13',
    '14' => '@app.list_music14',
    '15' => '@app.list_music15',
    '16' => '@app.list_music16'
  }
  return unless option == (1..16)

  list_option[option]
end

def start
  show_list_options
  option = gets.chomp

  if option == '17'
    puts 'Thank You!'
    exit
  end
  open_option(option)

  start
end

start
