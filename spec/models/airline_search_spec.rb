require 'rails_helper'
require 'airline_search'

RSpec.describe AirlineSearch do
    describe 'it search for best matching' do

        let(:from_0) { "Canadian Airport (CAN)" } 
        let(:to_0) { "Angola Airport (AGP)" }
        let(:departure_date_0) { "2023/07/01" }
        let(:airlines_data_0) { 
            [{ "id": 1,"airline": "First Class Air","from": "MAN","to": "LHR", "price": 470,"departure_date": "2023-06-15" },
             { "id": 2,"airline": "Oceanic Airlines","from": "CAN","to": "AGP","price": 245,"departure_date": "2023-07-01" },
             { "id": 3,"airline": "Trans American Airlines", "from": "MAN", "to": "LHR", "price": 170, "departure_date": "2023-08-15" }] 
            }

        let(:from_1) { "Manchestor Airport (MAN)" } 
        let(:to_1) { "Heathrow Airport (LHR)" }
        let(:departure_date_1) { "2023/06/15" }
        let(:airlines_data_1) { 
        [ { "id": 4, "airline": "First Class Air", "from": "MAN", "to": "LHR", "price": 470, "departure_date": "2023-06-15" },
          { "id": 5,"airline": "Oceanic Airlines", "from": "MAN", "to": "AGP", "price": 245, "departure_date": "2023-07-01" },
          { "id": 6, "airline": "Trans American Airlines",  "from": "MAN", "to": "LHR", "price": 170, "departure_date": "2023-06-15" }] 
        }

        let(:from_2) { "Manchestor Airport (MAN)" } 
        let(:to_2) { "Canadian Airport (CAN)" }
        let(:departure_date_2) { "2023/06/05" }
        let(:airlines_data_2) { 
        [ { "id": 4, "airline": "First Class Air", "from": "MAN", "to": "LHR", "price": 470, "departure_date": "2023-06-15" },
          { "id": 5,"airline": "Oceanic Airlines", "from": "MAN", "to": "AGP", "price": 245, "departure_date": "2023-07-01" },
          { "id": 6, "airline": "Trans American Airlines",  "from": "MAN", "to": "LHR", "price": 170, "departure_date": "2023-06-15" }] 
        }

        let(:from_3) { "Any Airport" } 
        let(:to_3) { "Angola Airport (AGP)" }
        let(:departure_date_3) { "2023/07/01" }
        let(:airlines_data_3) { 
        [ { "id": 4, "airline": "First Class Air", "from": "MAN", "to": "LHR", "price": 470, "departure_date": "2023-06-15" },
          { "id": 5,"airline": "Oceanic Airlines", "from": "MAN", "to": "AGP", "price": 245, "departure_date": "2023-07-01" },
          { "id": 6, "airline": "Trans American Airlines", "from": "MAN", "to": "LHR", "price": 170, "departure_date": "2023-06-15" }] 
        }
     
        it 'returns the best matching flight' do
            search_data = AirlineSearch.new(from_0, to_0, departure_date_0, airlines_data_0).search
            expect(search_data).to eq(2)
        end

        it 'returns the best and cheapest flight if there are more than one matching flights' do
            search_data = AirlineSearch.new(from_1, to_1, departure_date_1, airlines_data_1).search
            expect(search_data).to eq(6)
        end

        it 'returns no flights if no flight is matching' do
            search_data = AirlineSearch.new(from_2, to_2, departure_date_2, airlines_data_2).search
            expect(search_data).to eq("no flight")
        end

        it 'returns flights from any airport to destination airport, if from is `Any Airport` ' do
            search_data = AirlineSearch.new(from_3, to_3, departure_date_3, airlines_data_3).search
            expect(search_data).to eq(5)
        end
    end
end