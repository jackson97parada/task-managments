FactoryBot.define do
  factory :tag do
    name { Faker::Name.name }
    color { Faker::Color.hex_color }
    enable { true }
  end
end