class HotelSearch
    attr_reader :to, :arrival_date, :duration, :hotel_data

    def initialize(to, arrival_date, duration, hotel_data)
        @to = to
        @arrival_date = arrival_date
        @duration = duration
        @hotel_data = hotel_data
    end

    def search
       dep_date = date_format(@arrival_date)
       destn = country_code(@to)
       duration = count_nights(@duration)
       get_hotels(dep_date, destn, duration, @hotel_data)
    end

    def get_hotels(date, destination, duration, hotel_data)
        results = hotel_data.select {|hotel|
            hotel["arrival_date"] == date && hotel["nights"] == duration && hotel["local_airports"].include?(destination)
        }

        hotel = results.length > 1 ? results.sort_by {|x| x["price_per_night"]}.first : results.first
        hotel ? hotel["id"] : "no hotel"
    end

    def country_code(country_name)
        code = country_name[/\(.*\)/]
        code ? code.delete("()").upcase : ""
    end

    def date_format(date)
        date ? date.gsub("/", "-") : ""
    end

    def count_nights(duration)
        duration.to_s.delete(" nights").to_i
    end
end