class Menu
    def start_menu
        system "clear"
        puts " Welcome to Concert History Finder ".green.on_black
        puts " Search history of #{Event.all.count} Colorado events".green.on_black
        main_menu
    end

    def main_menu
        loop_menu = true
        system "clear"
        while loop_menu do

        puts "--How would you like to search for an event?--".white.on_black
        puts "1) Search by city"
        puts "2) Search by artist"
        puts "3) Search by venue"
        puts "0) Exit Program"
        print "Enter a menu option: "

        user_input = gets.chomp
            case user_input
            when "1"
                #system "clear"
                city_search_menu
            when "2"
                #system "clear"
                artist_search_menu
            when "3"
                #system "clear"
                venue_search_menu
            when "0"
                puts "Thank you for using Concert Finder!"
                exit
            else
                puts ""
                puts "Please retry with a valid menu option.".red
                puts ""
                #main_menu
            end
        end
    end

    def city_search_menu
        system "clear"
        puts "--City Search--".white.on_black
        print "Enter your city's zip code (q to quit): "
        user_city = gets.chomp
        if user_city.downcase == "q"
            system "clear"
            main_menu
        end
        puts ""

        return_to_main_menu user_city

        if Venue.find_cities(user_city).length == 0
            puts "No results found for that zip code."
        else
            venues = Venue.find_cities(user_city)

            relevant_events = []

            venues.each do |venue|
                relevant_events << venue.get_events
            end
        
            relevant_events.flatten!

            puts "Here are the events for #{user_city}:"
            relevant_events.length.times do |index|
                puts "#{index}) #{relevant_events[index].artist.artistname} played at #{relevant_events[index].venue.name} on #{relevant_events[index].playdate}"
            end

            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            #system "clear"
            start_menu
        end
    end

    def artist_search_menu
        system "clear"
        puts "--Artist Search--".white.on_black
        puts "There are #{Artist.all.count} artists on record"

        result = Artist.find_artist(user_artist)

        #binding.pry
        while true
            print "Enter the artist or band's name (q to quit): "
            user_artist = gets.chomp
            puts ""
            if user_artist.downcase == "q"
                system "clear"
                main_menu
            end

            result = Artist.find_artist(user_artist)
            if result
                shows = result.get_events()
                puts "Here are the events for #{user_artist}:"
                puts ""

                #binding.pry
                puts "#{result.artistname} played #{shows.length} show(s)..."
                shows.each {|event| puts "#{event.venue.name} on #{event.playdate}" }


                puts ""
                print "Press Return to go back to the main menu..."
                pause = gets
                #For testing, looping back to beginning
                system "clear"
                start_menu
            else
                puts "No results found for '#{user_artist}'. Try again."
                puts ""
                #artist_search_menu
            end

            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            #system "clear"
            start_menu
        else
            puts "No results found for that artist. Try again."
            puts ""
            artist_search_menu

        end
    end

    def venue_search_menu
        system "clear"
        puts "--Venue Search--".white.on_black
        puts "There are #{Venue.all.count} venues on record"
        print "Enter the venue's name (q to quit): "
        user_venue = gets.chomp        
        if user_venue.downcase == "q"
            main_menu
        end
        puts ""

        return_to_main_menu user_venue

        venue = Venue.find_venue(user_venue)
        if venue
            events = venue.get_events
            #binding.pry
            puts "Here are the upcoming events at #{user_venue}:"
            puts ""
            #Run find_venue again and post results here
            #Hard coded sample below
            events.each {|event| puts "#{event.artist.artistname} played on #{event.playdate}"}

            puts ""
            print "Press Return to go back to the main menu..."
            pause = gets
            #For testing, looping back to beginning
            start_menu
        else
            puts "No results found for that venue. Try again."
            puts ""
            venue_search_menu
        end
    end


    def return_to_main_menu choice
        if choice == "q"
            system "clear"
            start_menu
        end
    end

    #Placeholders for searching ActiveRecord
    #Currently returning true and false
    #Might be better if successful returns were checked base on
    #the length of the search result
    #i.e. length = 0 means no results, length > 0 means success

    def find_venue venue
        #Receives the venue name that the user entered
        #Returns events at that venue
        #If no results are found, returns nil
        #For now, will return true or false, as needed for testing

        true
        #false
    end
end