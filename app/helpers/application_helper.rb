module ApplicationHelper
    def country_code(country_name)
        if country_name.downcase.include?("any")
            "any_airport"
        else
            code = country_name[/\(.*\)/]
            code.delete("()").upcase
        end
    end

    def date_format(date)
        date.gsub("/", "-")
    end
end
