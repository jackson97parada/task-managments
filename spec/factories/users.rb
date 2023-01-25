FactoryBot.define do
  factory :user do
    email { "example" }
    password { "password" }
    enable { false }
  end
end
