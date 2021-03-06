# Mod 1 Project - Colorado Event Finder

This CLI program searches recent history (2013 - 2019) of events in venues in Colorado.

Data is in three models: `Event`, `Artist`, and `Venue`.

- `Venue` - `Artist` is a many to many relationship
- `Artist` - `Event` is a one to many relationship
- `Venue` - `Event`  is a one to many relationship

## Main Menu Functions

1. `City` search finds all events occuring in a selected city
    - Enter a zip code to find a city

1. `Artist` search finds all events by a selected artist
    - Enter a search string to find an artist
    - If more than one artist is returned, a selection prompt will appear
    - If only one artist is returned, that info is automatically displayed
1. `Venue` search finds all events in a selcted venue
    - Enter a search string to find an venue
    - If more than one venue is returned, a selection prompt will appear
    - If only one venue is returned, that info is automatically displayed

1. `Stats` shows a variaty of statistics on the database used
    - First stat will display the number of events that happened each year
    - Second stat will display the ten venues with the most events

Data was taken from a Pollstar.com API scrape saved in MySQL, then exported to a seed file format. Only events occouring in Colorado venues and artists who played at Colorado venues were exported. There were accuracy issues with provided data but these were worked around by excluding bad records.