FactoryBot.define do
  factory :post do
    content { Faker::Lorem.characters(number: 15) }
  end
end
