FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    document { Faker::IDNumber.valid }
    mobile { Faker::Number.number(digits: 10) }
    salary { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    enable { true }
    user
  end
end
