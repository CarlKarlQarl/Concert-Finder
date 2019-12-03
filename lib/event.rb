class Event

attr_reader :eventId , :eventName , :venueId 

    def initialize

    end


    def search_by_city(cityID)
        @@all.select do  |event| 
            event.artist == artistID
        end
    end

    def search_by_artist(artistID)
        @@all.select do  |event| 
            event.artist == artistID
        end

    end

    def search_by_venue(venueID)
        @@all.select do  |event| 
            event.venue == venueID
        end
    end



    def self.load()

    end




end
