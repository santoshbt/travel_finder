require 'rails_helper'

RSpec.describe TextFormatter, :type => :model do
    describe 'returns the country name text in correct format' do
        let(:country_name_0) { "Angola Airport (AGP)" }
            
        it 'returns the country code' do
            json_output = described_class.new(country_name: country_name_0, date: nil, duration: nil).get_country_code
            expect(json_output).to eq("AGP")
        end

        let(:country_name_1) { "Any Airport" }

        it 'returns `any_airport` if the country name is `Any Airport`' do
            json_output = described_class.new(country_name: country_name_1, date: nil, duration: nil).get_country_code
            expect(json_output).to eq("any_airport")
        end

        let(:country_name_2) { "Any London Airport" }

        it 'returns `any_airport` if the country name is `Any London Airport`' do
            json_output = described_class.new(country_name: country_name_2, date: nil, duration: nil).get_country_code
            expect(json_output).to eq("any_airport")
        end
    end

    describe 'returns the date text in correct format' do
        let(:date_0) { "2023/06/07" }
            
        it 'returns the proper date' do
            json_output = described_class.new(country_name: nil, date: date_0, duration: nil).date_formatter
            expect(json_output).to eq("2023-06-07")
        end

        it 'returns empty string if date is nil' do
            json_output = described_class.new(country_name: nil, date: nil, duration: nil).date_formatter
            expect(json_output).to eq("")
        end
    end

    describe 'returns the duration text in number format' do
        let(:duration_0) { "8 nights" }
            
        it 'returns the number of nights' do
            json_output = described_class.new(country_name: nil, date: nil, duration: duration_0).duration_formatter
            expect(json_output).to eq(8)
        end

        it 'returns 0 if duration is nil' do
            json_output = described_class.new(country_name: nil, date: nil, duration: nil).duration_formatter
            expect(json_output).to eq(0)
        end
    end

end