class TextFormatter
    attr_reader :country_name, :date, :duration
    
    def initialize(country_name:, date:, duration:)
       @country_name = country_name
       @date = date
       @duration = duration
    end

    def get_country_code
        unless @country_name.nil?
            if @country_name.downcase.include?("any")
                "any_airport"
            else
                code = @country_name[/\(.*\)/]
                code ? code.delete("()").upcase : ""
            end
        end    
    end

    def date_formatter
        @date ? @date.gsub("/", "-") : ""
    end

    def duration_formatter
        @duration ? @duration.to_s.delete(" nights").to_i : 0
    end

end