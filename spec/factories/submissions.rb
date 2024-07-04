FactoryBot.define do
  factory :submission do
    email { Faker::Internet.email }
    mobile_phone { Faker::PhoneNumber.phone_number }
    resume { Faker::Lorem.words(number: 4) }
    job
  end
end
