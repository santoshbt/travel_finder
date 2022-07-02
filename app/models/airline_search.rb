class AirlineSearch
    require 'text_formatter'
    attr_reader :from, :to, :departure_date

    def initialize(from, to, departure_date, airlines_data)
        @from = from
        @to = to
        @departure_date = departure_date
        @airlines_data = airlines_data
    end

    def search
        dep_date = date_format(@departure_date)
        source = country_code(@from)
        destn = country_code(@to)
        get_airlines(dep_date, source, destn, @airlines_data)
    end

    def get_airlines(date, source, destination, airlines_data)
        results = airlines_data.select {|airline|
            if source == "any_airport" 
                airline["to"] == destination && airline["departure_date"] == date
            else
                airline["from"] == source && airline["to"] == destination && airline["departure_date"] == date
            end
        }

        flight = results.length > 1 ? results.sort_by {|x| x["price"]}.first : results.first
        flight ? flight["id"] : "no flight"
    end

    def country_code(country_name)
        TextFormatter.new(country_name: country_name, date: nil, duration: nil).get_country_code
    end

    def date_format(date)
        TextFormatter.new(country_name: nil, date: date, duration: nil).date_formatter
    end
end