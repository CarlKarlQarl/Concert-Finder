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





    def self.by_id(id)
        #binding.pry
        all.select do |venue|
            venue.venueID == id
        end
    end

    def self.find_relevant_events venues
        relevant_venue_ids = venues.map do |venue|
            venue["id"]
        end

        relevant_events = Event.all.select do |event|
            relevant_venue_ids.include? event["venue_id"]
        end
        relevant_events
    end
end
