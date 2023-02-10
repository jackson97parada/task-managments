class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  has_many :permission_roles

  validates :name, presence: true, uniqueness: true
end
