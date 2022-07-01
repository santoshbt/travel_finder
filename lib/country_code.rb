module CountryCode
    def get_code
        puts(self)       
        if text.downcase.include?("any")
            "any_airport"
        else
            code = text[/\(.*\)/]
            code.delete("()").upcase
        end
    end
end