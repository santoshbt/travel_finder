require 'rails_helper'
require 'airline_search'

RSpec.describe HotelSearch do
    describe 'it search for best matching' do
        let(:to_0) { "Malaga Airport (AGP)" }
        let(:arrival_date_0) { "2022/11/05" }
        let(:duration_0) { "7 nights" }
        let(:hotels_data_0) { 
            [
             { "id" => 1, "name" => "Hotel 01", "arrival_date" => "2022-12-06","price_per_night" => 100,
                "local_airports" => ["LHR"],"nights": 10},
             { "id" => 2, "name" => "Hotel 02", "arrival_date" => "2022-10-09","price_per_night" => 100,
                "local_airports" => ["MAN"],"nights" => 5 },
             { "id" => 3, "name" => "Iberostar Grand Portals Nous", "arrival_date" => "2022-11-05","price_per_night" => 150,
                "local_airports" => ["AGP"],"nights" => 7 }, 
            ]}

        it 'returns the best matching hotel' do
            search_data = described_class.new(to_0, arrival_date_0, duration_0, hotels_data_0).search
            expect(search_data).to eq(3)
        end

        let(:to_1) { "London Airport (LHR)" }
        let(:arrival_date_1) { "2022/12/10" }
        let(:duration_1) { "7 nights" }
        let(:hotels_data_1) { 
            [{ "id" => 1, "name" => "Iberostar Grand Portals Nous", "arrival_date" => "2022-12-10","price_per_night" => 150,
                "local_airports" => ["LHR"],"nights" => 7 },
             { "id" => 2, "name" => "Hotel 01", "arrival_date" => "2022-12-06","price_per_night" => 100,
                "local_airports" => ["AGP"],"nights" => 10},
             { "id" => 3, "name" => "Hotel 5 star", "arrival_date" => "2022-12-10","price_per_night" => 100,
                "local_airports" =>["LHR"],"nights" => 7 },
             { "id" => 4, "name" => "Hotel 02", "arrival_date" => "2022-10-09","price_per_night" => 100,
                "local_airports" => ["MNC"],"nights" => 5 }, 
            ]}

        it 'returns the best and cheapest matching hotel if there are multiple hotels' do
            search_data = described_class.new(to_1, arrival_date_1, duration_1, hotels_data_1).search
            expect(search_data).to eq(3)
        end

        let(:to_3) { "London Airport (LHR)" }
        let(:arrival_date_3) { "2022/12/10" }
        let(:duration_3) { "7 nights" }
        let(:hotels_data_3) { 
            [{ "id" => 1, "name" => "Iberostar Grand Portals Nous", "arrival_date" => "2022-01-10","price_per_night" => 150,
                "local_airports" => ["LHR"],"nights"=> 8 },
             { "id": 2, "name"=> "Hotel 01", "arrival_date" => "2022-12-06","price_per_night" => 100,
                "local_airports"=> ["AGP"],"nights": 10},
             { "id": 4, "name"=> "Hotel 02", "arrival_date"=> "2022-10-09","price_per_night"=> 100,
                "local_airports"=> ["MAN"],"nights"=> 5 }, 
            ]}

        it 'returns no hotels if there are no matching results' do
            search_data = described_class.new(to_3, arrival_date_3, duration_3, hotels_data_3).search
            expect(search_data).to eq("no hotel")
        end

    end
end
