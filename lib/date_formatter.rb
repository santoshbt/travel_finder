module DateFormatter
    def custom_format(date)
        date.gsub("/", "-")
    end
end