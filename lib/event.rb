class Event

attr_reader :eventID , :eventName , :venueID , :artist
    @@all = []


    def initialize(eventID,venueID,playDate,name,artistID)
        
        @eventID =  eventID
        @venueID = Venue.by_id(venueID)
        @name = name
        @artist = Artist.by_id(artistID)
        @@all.push(self)
        binding.pry
    end



    def self.all
        @@all
    end

    # def search_by_city(cityID)
    #     @@all.select do  |event| 
    #         event.artist == artistID
    #     end
    # end

    def search_by_venue(venueID)
        all.select do  |event| 
            event.venue == venueID
        end
    end



    def self.load(data)
        data = data.uniq
        data.each do |e|
            #binding.pry
            Event.new(e["EventID"],e["VenueID"],e["PlayDate"],e["Name"],e["ArtistID1"])
        end
        puts @@all.count.to_s + " Events loaded."
        sleep(0.5)
    end


    def self.by_id(id)
        @@all.select do |event|
            event.eventID == id
        end
    end




end
