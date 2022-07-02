require 'rails_helper'
require 'journey_finder'

RSpec.describe JourneyFinder do
    describe 'it searches the best matching flight and hotel' do
        let(:departing_from_0) { "Manchester Airport (MAN)" }
        let(:traveling_to_0) { "Malaga Airport (AGP)" }
        let(:departure_date_0) { "2023/07/01" }
        let(:duration_0) { "7 nights" }

        it 'returns the best matching flight and hotel' do
            search_data = described_class.new(departing_from_0, traveling_to_0, departure_date_0, duration_0).holiday_search
            expect(search_data).to eq("Flight 2 and Hotel 9")
        end

        let(:departing_from_1) { "Any London Airport" }
        let(:traveling_to_1) { "Mallorca Airport (PMI)" }
        let(:departure_date_1) { "2023/06/15" }
        let(:duration_1) { "10 nights" }

        it 'returns the best matching flight and hotel for any London airport' do
            search_data = described_class.new(departing_from_1, traveling_to_1, departure_date_1, duration_1).holiday_search
            expect(search_data).to eq("Flight 6 and Hotel 5")
        end

        let(:departing_from_2) { "Any Airport" }
        let(:traveling_to_2) { "Gran Canaria Airport (LPA)" }
        let(:departure_date_2) { "2022/11/10" }
        let(:duration_2) { "14 nights" }

        it 'returns the best matching flight and hotel for any airport' do
            search_data = described_class.new(departing_from_2, traveling_to_2, departure_date_2, duration_2).holiday_search
            expect(search_data).to eq("Flight 7 and Hotel 6")
        end
    end
end