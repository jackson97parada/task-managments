class Enterprise < ApplicationRecord
  belongs_to :user

  validates :nit, presence: true, uniqueness: true
  validates :address, presence: true
  validates :mobile, presence: true, uniqueness: true
end
