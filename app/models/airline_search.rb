class AirlineSearch
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
        if country_name.downcase.include?("any")
            "any_airport"
        else
            code = country_name[/\(.*\)/]
            code ? code.delete("()").upcase : ""
        end
    end

    def date_format(date)
        date ? date.gsub("/", "-") : ""
    end
end