FactoryBot.define do
  factory :enterprise do
    nit { Faker::IDNumber.valid }
    address { Faker::Address.city }
    mobile { Faker::Number.leading_zero_number(digits: 10) }
    enable { true }
    user
  end
end
