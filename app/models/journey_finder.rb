class JourneyFinder
    require 'file_reader' 
    require 'airline_search'
    require 'hotel_search'

    AIRLINE_DATA = Rails.root.to_s + "/app/data/airlines.json"
    HOTEL_DATA = Rails.root.to_s + "/app/data/hotels.json"

    def initialize(departing_from, traveling_to, departure_date, duration)
        @departing_from = departing_from
        @traveling_to = traveling_to
        @dep_date = departure_date
        @duration = duration
        @airlines_data = FileReader.new(AIRLINE_DATA).parse_search_file
        @hotel_data = FileReader.new(HOTEL_DATA).parse_search_file
    end

    def holiday_search
        best_flight = AirlineSearch.new(@departing_from, @traveling_to, @dep_date, @airlines_data).search 
        best_hotel = HotelSearch.new(@traveling_to, @dep_date, @duration, @hotel_data).search
        "Flight #{best_flight} and Hotel #{best_hotel}"
    end
end