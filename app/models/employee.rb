class Employee < ApplicationRecord

  has_many :task_assignments
  has_many :tasks, through: :task_assignments 

  validates :name, presence: true
  validates :last_name, presence: true
  validates :document, presence: true, uniqueness: true
  validates :mobile, presence: true, uniqueness: true
end
