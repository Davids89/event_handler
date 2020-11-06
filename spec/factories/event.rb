FactoryBot.define do
  factory :event do
    title { Faker::Games::Zelda.character }
    description { Faker::Games::Zelda.item }
    start_date { Time.zone.now }
    end_date { Time.zone.now + 1.hour }
  end
end
