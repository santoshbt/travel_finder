require 'rails_helper'

RSpec.describe FileReader, :type => :model do
    describe 'parse the json file' do
        let(:test_json_file) { Tempfile.new('json') }
            
        it 'reads the file and returns the json output' do
            test_json_file << "[{\"a\": 1, \"b\": 2}]"
            test_json_file.flush
            json_output = described_class.new(test_json_file).parse_search_file
            expect(json_output).to eq([{"a" => 1, "b" => 2}])
        end
    end
end