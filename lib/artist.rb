class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        songs = Song.all
        songs.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        # self.all.include?(name) ? self.all.find{|artist| artist.name = name} : self.new(name)
        self.all.find{|artist| artist.name = name} == nil ? self.new(name) : self.all.find{|artist| artist.name = name}
    end

    def print_songs
        songs = self.songs
        songs.each do |song|
            puts song.name
        end
    end
end