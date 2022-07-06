class HotelSearch
    require 'text_formatter'

    attr_reader :to, :arrival_date, :duration, :hotel_data

    def initialize(to, arrival_date, duration, hotel_data)
        @to = to
        @arrival_date = arrival_date
        @duration = duration
        @hotel_data = hotel_data
    end

    def search
       dep_date = date_format(arrival_date)
       destn = country_code(to)
       no_of_nights = count_nights(@duration)
       get_hotels(dep_date, destn, no_of_nights, hotel_data)
    end

    def get_hotels(date, destination, no_of_nights, hotel_data)
        results = hotel_data.select {|hotel|
            hotel["arrival_date"] == date && hotel["nights"] == no_of_nights && hotel["local_airports"].include?(destination)
        }

        hotel = results.length > 1 ? results.sort_by {|x| x["price_per_night"]}.first : results.first
        hotel ? hotel["id"] : "no hotel"
    end

    def country_code(country_name)
        TextFormatter.new(country_name: country_name, date: nil, duration: nil).get_country_code
    end

    def date_format(date)
        TextFormatter.new(country_name: nil, date: date, duration: nil).date_formatter
    end

    def count_nights(duration)
        TextFormatter.new(country_name: nil, date: nil, duration: duration).duration_formatter
    end
end