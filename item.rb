require 'date'
class Item
    attr_reader :genre,:author,:source,:label,:id
    attr_accessor :archived,:publish_date
    def initialize(publish_date)
        @id=rand(1..100)
        @publish_date=publish_date
        @archived=false
    end
    def set_genre(genre)
        genre=genre
    end
    def set_author(author)
        author=author
    end
    def set_source(source)
        source=source
    end
    def set_label(label)
        label=label
    end
    def can_be_archived?
        (Date.today.year - (Date.parse(@publish_date)).year) > 10
    end
    def move_to_archive
        @archived = can_be_archived
    end
end
