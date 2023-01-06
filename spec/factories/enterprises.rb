FactoryBot.define do
  factory :enterprise do
    nit { Faker::IDNumber.valid }
    address { Faker::Address.city }
    mobile { Faker::IDNumber.invalid }
    enable { true }
  end
end