FactoryBot.define do
  factory :permission_role do
    role
    permission { "view_task" }
  end
end
