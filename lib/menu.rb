class Menu
    def start_menu
        system "clear"
        puts " Welcome to Concert Finder ".green.on_black
        puts " Search for Colorado events happening in January 2020 ".green.on_black
        main_menu
    end

    def main_menu
        puts "--How would you like to search for an event?--".white.on_black
        puts "1) Search by city"
        puts "2) Search by artist"
        puts "3) Search by venue"
        print "Enter a menu option: "
        user_input = gets.chomp

        case user_input
        when "1"
            system "clear"
            city_search_menu
        when "2"
            system "clear"
            artist_search_menu
        when "3"
            system "clear"
            venue_search_menu
        else
            puts ""
            puts "Please retry with a valid menu option.".red
            puts ""
            main_menu
        end
    end

    def city_search_menu
        puts "--City Search--".white.on_black
        print "Enter your city's zip code: "
        user_city = gets.chomp
        puts ""

        if find_city(user_city).length == 0
            puts "No results found for that zip code."
        else
            venues = find_city user_city
            
            relevant_venue_ids = venues.map do |venue|
                venue["id"]
            end

            relevant_events = Event.all.select do |event|
                relevant_venue_ids.include? event["venue_id"]
            end
        
            puts "Here are the events for #{user_city}:"
            relevant_events.length.times do |index|
                puts "#{index}) #{relevant_events[index].artist.artistname} played at #{relevant_events[index].venue.name} on #{relevant_events[index].playdate}"
            end
        end
    end

    def artist_search_menu
        puts "--Artist Search--".white.on_black
        print "Enter the artist or band's name: "
        user_artist = gets.chomp
        puts ""

        result = Artist.find_artist(user_artist)

        binding.pry
        if result
            shows = result.get_events()
            puts "Here are the upcoming events for #{user_artist}:"
            puts ""

            #binding.pry
            puts "#{result.artistname} is playing #{shows.length} shows..."
            shows.each {|event| puts "#{event.venue.name} on #{event.playdate}" }


            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            system "clear"
            start_menu
        else
            puts "No results found for that artist. Try again."
            puts ""
            artist_search_menu
        end
    end

    def venue_search_menu
        puts "--Venue Search--".white.on_black
        print "Enter the venue's name: "
        user_venue = gets.chomp
        puts ""

        if find_venue user_venue
            puts "Here are the upcoming events at #{user_venue}:"
            puts ""
            #Run find_venue again and post results here
            #Hard coded sample below
            puts "Bon Jovi on 1/12"
            puts "Weird Al on 1/1"
            puts "Cher on 1/15"
            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            system "clear"
            start_menu
        else
            puts "No results found for that venue. Try again."
            puts ""
            artist_search_menu
        end
    end

    #Placeholders for searching ActiveRecord
    #Currently returning true and false
    #Might be better if successful returns were checked base on
    #the length of the search result
    #i.e. length = 0 means no results, length > 0 means success

    def find_city city
        Venue.all.select do |venue|
            venue.zip == city
        end
    end



    def find_venue venue
        #Receives the venue name that the user entered
        #Returns events at that venue
        #If no results are found, returns nil
        #For now, will return true or false, as needed for testing

        true
        #false
    end
end