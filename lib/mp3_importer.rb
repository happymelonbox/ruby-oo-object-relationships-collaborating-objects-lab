require 'pry'
class MP3Importer

    attr_accessor :path

    @@files = []

    def initialize(path)
        @path = path
    end

    def self.parse_filename(file_name)
        filename = file_name.chomp(".mp3").split(" - ")
        filename
    end

    def files
        files = Dir.children(@path)
        files.each do |file| 
            @@files << file
        end
    end

    def import
        @@files.each do |file|
           Song.new_by_filename(file)
        end
    end

end