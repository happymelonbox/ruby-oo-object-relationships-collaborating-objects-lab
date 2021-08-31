require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.parse_filename(file_name)
        filename = file_name.chomp(".mp3").split(" - ")
        filename
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

    def self.new_by_filename(file_name)
        filename = self.parse_filename(file_name)
        new_song = Song.new(filename[1])
        new_song.artist_name = filename[0]
        new_song
    end

end