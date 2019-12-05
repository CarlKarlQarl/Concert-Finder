class Event < ActiveRecord::Base
    belongs_to :venue 
    belongs_to :artist
# attr_reader :eventID , :eventName , :venueID , :artist
#     @@all = []


#     def initialize(eventID,venueID,playDate,name,artistID)
        
#         @eventID =  eventID
#         @venueID = Venue.by_id(venueID)
#         @name = name
#         @artist = Artist.by_id(artistID)
#         @@all.push(self)
#         #binding.pry
#     end



#     def self.all
#         @@all
#     end

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
        #obsolete
        data = data.uniq
        data.each do |e|
            #binding.pry
            Event.new(e["EventID"],e["VenueID"],e["PlayDate"],e["Name"],e["artistid"])
        end
        puts @@all.count.to_s + " Events loaded."
        sleep(0.5)
    end


    def self.by_id(id)
        @@all.select do |event|
            event.eventID == id
        end
    end

    def self.events_per_year
        all_years = Event.all.map do |event|
            event["playdate"].year
        end

        year_counts = {}
        all_years.each do |year|
            if !year_counts[year]
                year_counts[year] = 1
            else
                year_counts[year] += 1
            end
        end

        sorted_year_counts = year_counts.sort_by do |key, value|
            key
        end
    end


end
