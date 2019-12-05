class Menu
    def main_menu
        system "clear"
        puts " Welcome to Concert History Finder ".green.on_black
        puts " Search history of #{Event.all.count} Colorado events".green.on_black

        while true do
            puts "--How would you like to search for an event?--".white.on_black
            puts "1) Search by city"
            puts "2) Search by artist"
            puts "3) Search by venue"
            puts "4) Display number of events per year"
            puts "5) Display most active venues"
            puts "0) Exit Program"
            print "Enter a menu option: "

            user_input = gets.chomp
            case user_input
            when "1"
                city_search_menu
            when "2"
                artist_search_menu
            when "3"
                venue_search_menu
            when "4"
                events_per_year_menu
            when "5"
                most_active_venues_menu
            when "0"
                puts "Thank you for using Concert Finder!"
                exit
            else
                puts ""
                puts "Please retry with a valid menu option.".red
                puts ""
            end
        end
    end

    def city_search_menu
        system "clear"
        puts "--City Search--".white.on_black
        while true do
            print "Enter your city's zip code (q to quit): "
            user_city = gets.chomp
            return_to_main_menu user_city
            puts ""
            if user_city.length == 0
                user_city = "1"
            end
            venues = Venue.find_cities(user_city)

            if venues.length == 0
                puts "No results found for that zip code."
            else
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
                main_menu
            end
        end
    end

    def artist_search_menu
        system "clear"
        puts "--Artist Search--".white.on_black
        puts "There are #{Artist.all.count} artists on record"

        #binding.pry
        while true
            print "Enter the artist or band's name (q to quit): "
            user_input = gets.chomp
            return_to_main_menu(user_input)
            puts ""

            artists = Artist.find_artist(user_input)
            if artists
            
                if artists.count > 1 then
                    i = 0
                    puts "#{artists.count} found for search string #{user_input}."
                    while i < artists.count
                        puts "[#{i +1}] #{artists[i].artistname}"
                        i += 1
                    end
                    while true
                    print "\nSelect: "
                        user_select = gets.chomp.to_i - 1
                        if user_select.between?(0,artists.count + 1)
                            #binding.pry
                            artist = artists[user_select]
                            break
                        else
                            return_to_main_menu(user_select)
                            puts "Invalid selection"
                        end
                    end
                elsif artists.count == 1
                    artist = artists[0]
                end
            else
                puts "No artists found for search string #{user_input}"
            end

            
            if artist
                shows = artist.get_events()

                if shows.count == 1 then
                    puts "\nThere is #{shows.length} event for #{artist.artistname}:\n"
                else
                    puts "\nThere are #{shows.length} events for #{artist.artistname}:\n"
                end

                shows.each {|event| puts "#{event.venue.name} on #{event.playdate}" }
                print "\nPress Return to go back to the main menu..."

                pause = gets
                main_menu
            else
                puts "No artists found for '#{user_input}'. Try again."
            end
        end
    end

    def venue_search_menu
        system "clear"
        puts "--Venue Search--".white.on_black
        puts "There are #{Venue.all.count} venues on record"
        while true

            print "Enter the venue's name (q to quit): "
            user_input = gets.chomp
            return_to_main_menu(user_input)
            puts ""

            venues = Venue.find_venue(user_input)
            if venues
            
                if venues.count > 1 then
                    i = 0
                    puts "#{venues.count} found for search string #{user_input}."
                    while i < venues.count
                        puts "[#{i +1}] #{venues[i].name}"
                        i += 1
                    end
                    while true
                        print "\nSelect: "
                        user_select = gets.chomp.to_i - 1
                        #binding.pry
                        if user_select.between?(0,venues.count)
                            #binding.pry
                            venue = venues[user_select]
                            break
                        else
                            return_to_main_menu(user_select)
                            puts "Invalid selection"
                        end
                    end
                elsif venues.count == 1
                    venue = venues[0]
                end
            else
                puts "No venues found for search string #{user_input}"

            end

            if venue
                events = venue.get_events
                #binding.pry
                if events.count == 1 then
                    puts "\nThere is #{events.length} event for #{venue.name}:\n"
                else
                    puts "\nThere are #{events.length} events for #{venue.name}:\n"
                end
                #Run find_venue again and post results here
                #Hard coded sample below
                events.each {|event| puts "#{event.artist.artistname} played on #{event.playdate}"}

                puts ""
                print "\nPress Return to go back to the main menu..."
                pause = gets
                main_menu
            else
                puts "No results found for that venue. Try again."
                puts ""
                venue_search_menu
            end
        end
    end

    def events_per_year_menu
        system "clear"
        puts "--Displaying Number of Events for each Year on Record--".white.on_black
        puts ""

        sorted_year_counts = Event.events_per_year

        puts "Year : # of Events".underline
        sorted_year_counts.each do |year_count|
            puts "#{year_count[0]} : #{year_count[1]}"
        end
        
        puts ""
        print "Press Return to go back to the main menu..."
        pause = gets
        main_menu
    end

    def most_active_venues_menu
        system "clear"
        puts "--Displaying Top 10 Most Active Venues--".white.on_black
        puts ""

        most_active = Venue.most_active_venues

        10.times do |index|
            puts "#{most_active[index][0].name} had #{most_active[index][1]} events"
        end

        puts ""
        print "Press Return to go back to the main menu..."
        pause = gets
        main_menu
    end

    def return_to_main_menu choice
        if choice == "q"
            system "clear"
            main_menu
        end
    end
end