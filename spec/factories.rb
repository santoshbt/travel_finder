FactoryBot.define do
    factory :airlines_data do
        [
            {
              "id": 1,
              "airline": "First Class Air",
              "from": "MAN",
              "to": "TFS",
              "price": 470,
              "departure_date": "2023-07-01"
            },
            {
              "id": 2,
              "airline": "Oceanic Airlines",
              "from": "MAN",
              "to": "AGP",
              "price": 245,
              "departure_date": "2023-07-01"
            },
            {
              "id": 3,
              "airline": "Trans American Airlines",
              "from": "MAN",
              "to": "PMI",
              "price": 170,
              "departure_date": "2023-06-15"
            }
        ]
    end
end