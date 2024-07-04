FactoryBot.define do
  factory :recruiter do
    email { Faker::Internet.email }
    password { 'password' }
  end
end
