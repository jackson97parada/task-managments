class Employee < ApplicationRecord
  validates :name, presence: true
  validates :last_name, presence: true
  validates :document, presence: true, uniqueness: true
  validates :mobile, presence: true, uniqueness: true
end
