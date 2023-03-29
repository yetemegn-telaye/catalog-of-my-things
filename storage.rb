require 'json'

class Storage
    MUSIC_ALBUM_FILE = './data/music_album.json'
    GENRES_FILE = './data/genre.json'
    BOOKS_FILE = './data/books.json'
    LABELS_FILE = './data/labels.json'

    def initialize(app)
        @app = app
    end

    def load_data
        load_music_albums(MUSIC_ALBUM_FILE,@app.music_albums)
        load_genres(GENRES_FILE,@app.genres)
        load_books(BOOKS_FILE,@app.books)
        load_labels(LABELS_FILE,@app.labels)
    end

    def save_data
        File.write(MUSIC_ALBUM_FILE, JSON.pretty_generate(@app.music_albums.map(&:to_h)))
        File.write(GENRES_FILE, JSON.pretty_generate(@app.genres.map(&:to_h)))
        File.write(BOOKS_FILE, JSON.pretty_generate(@app.books.map(&:to_h)))
        File.write(LABELS_FILE, JSON.pretty_generate(@app.labels.map(&:to_h)))
    end

    private

    def read_data(filename)
        return [] unless File.exist?(filename)
        
        file = File.open(filename)
        file_data = file.read
        file.close
        return JSON.parse(file_data) unless file_data.empty?
        []
    end

    def load_genres(filename, genres)
        file_data = read_data(filename)
        file_data.each do |data|
            genre = Genre.new(data['name'])
            genres << genre
        end
    end

    def load_music_albums(filename, music_albums)
        file_data = read_data(filename)
        file_data.each do |data|
            music_album = MusicAlbum.new(data['title'], data['on_spotify'], data['publish_date'])
            music_albums << music_album
        end
    end

    def load_books(filename, books)
        file_data = read_data(filename)
        file_data.each do |data|
          book = Book.new(data['title'], data['publish_date'], data['publisher'], data['cover_state'])
          books << book
        end
      end

    def load_labels(filename, labels)
        file_data = read_data(filename)
        file_data.each do |data|
            label = Label.new(data['title'], data['color'])
            labels << label
        end
    end
   
end 