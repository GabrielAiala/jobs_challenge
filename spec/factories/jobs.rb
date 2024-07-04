FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.forward(days: 23) }
    end_date { Faker::Date.forward(days: 30) }
    status { %w[active inactive].sample }
    skill { Faker::Job.key_skill }
    recruiter
  end
end
