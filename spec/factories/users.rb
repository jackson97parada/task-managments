FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "Wqwe12334*" }
    enable { false }

    transient do
      role_name { "Admin" }
    end

    trait :with_role do
      after(:build) do |user, evaluator|
        role = Role.find_by(name: evaluator.role_name) || create(:role)
        user.roles << role
      end
    end
  end
end
