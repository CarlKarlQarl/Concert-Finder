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

    def self.load(data)
        data = data.uniq
        data.each do |e|
            Venue.new(e["VenueID"],e["Name"],e["CityID"],e["City"],e["State"],e["Zip"])
        end
        puts @@all.count.to_s + " Venues loaded."
        sleep(0.5)
        #binding.pry
    end




    def self.by_id(id)
        #binding.pry
        all.select do |venue|
            venue.venueID == id
        end
    end

    def self.find_venue(name)
        result = all.find {|venue| venue.name.downcase == name.downcase}
    end

end
