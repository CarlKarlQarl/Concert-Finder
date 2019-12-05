class Venue < ActiveRecord::Base
    has_many :events
    has_many :artists, :through => :events
    #attr_reader :venueID , :name , :cityID , :city, :state, :zip, :locaion, :lat, :lng


    # @@all = []
    # def initialize (venueID,name,cityID,city,state,zip)
    #     @name = name
    #     @cityID = cityID
    #     @location = "#{city}, #{state}" 
    #     @city = city
    #     @state = state
    #     @zip = zip
    #     @@all.push(self)
    #     #binding.pry
    # end


    # def self.all
    #     @@all
    # end

    def get_events()
        Event.all.select do |event|
            event.venue.name.downcase == self.name.downcase
        end
    end


    def self.by_id(id)
        #binding.pry
        all.select do |venue|
            venue.venueID == id
        end
    end

    def self.find_venue(name)
        result = all.select {|venue| venue.name.downcase.include? name.downcase}

        #binding.pry
    end


    def self.find_cities(zip)
        Venue.all.select do |venue|
            venue.zip == zip
        end
    end

    def self.most_active_venues
        venue_event_count = {}
        Event.all.each do |event|
            if !venue_event_count[event.venue]
                venue_event_count[event.venue] = 1
            else
                venue_event_count[event.venue] += 1
            end
        end

        most_active = venue_event_count.sort_by do |key, value|
            value
        end.reverse
    end
end
