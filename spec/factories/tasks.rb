FactoryBot.define do
  factory :task do
    title { Faker::Job.title }
    description { Faker::Lorem.sentences(number: 1) }
    start_date { Date.today }
    end_date { Date.today }
    status { 0 }
    tag
  end
end
