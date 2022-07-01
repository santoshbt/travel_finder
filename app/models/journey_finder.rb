class JourneyFinder
    require 'file_reader' 
    require 'airline_search'

    AIRLINE_DATA = Rails.root.to_s + "/app/data/airlines.json"
    HOTEL_DATA = Rails.root.to_s + "/app/data/hotels.json"

    def initialize(attrs = {})
        @departing_from = attrs[:departing_from]
        @traveling_to = attrs[:traveling_to]
        @dep_date = attrs[:departure_date]
        @duration = attrs[:duration]
        @hotel_data = FileReader.new(file: AIRLINE_DATA).parse_search_file
        @airlines_data = FileReader.new(file: HOTEL_DATA).parse_search_file
    end

    def holiday_search
        best_flight = AirlineSearch.new(@departing_from, @traveling_to, @dep_date, @airlines_data) 
    end
end