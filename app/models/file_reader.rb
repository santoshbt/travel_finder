class FileReader
    require 'json'
    attr_reader :file_path

    def initialize(file_path)
        @file_path = file_path
    end

    def parse_search_file
        file = File.open(file_path)
        file_data = File.read(file)
        JSON.parse(file_data)
    end
end