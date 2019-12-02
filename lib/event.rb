class Event

attr_reader

def initilize

end


def search_by_city
    @@all.select do  |event| 
        
        event.artist == artist
        end
end

def search_by_artist(artist)
    @@all.select do  |event| 
        event.artist == artist
    end

end

def search_by_venue
    @@all.select do  |event| 
        event.artist == artist
    end
end







end
