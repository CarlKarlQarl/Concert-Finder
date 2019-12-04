class Artist < ActiveRecord::Base
    has_many :events
    has_many :venues, :through => :events
    # attr_reader :artistID, :artistName, :artistType, :genres

    # @@all =[]


    # # def initialize( artistID, artistName, genres)
    # #     @artistID = artistID
    # #     @artistName = artistName
    # #     @genres  = genres
    # #     @@all.push(self)
    # # end

    # def self.all
    #     @@all
    # end


    def self.load(data)
        data =  data.uniq
        data.each do |e|
            Artist.new(e["ArtistID"],e["ArtistName"],e["Genre"])
        end
        puts all.count.to_s + " Artists loaded."
        sleep(0.5)
        #binding.pry
    end

    def search_events()
        Event.all.select do  |event| 
            event.artist == self
        end
    end


    def self.by_id(id)
        all.select do |artist|
            artist.artistID == id
        end
    end
    

end
