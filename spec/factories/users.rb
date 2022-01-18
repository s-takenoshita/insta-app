FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '99999999' }
  end

end
