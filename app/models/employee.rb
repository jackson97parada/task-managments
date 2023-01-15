class Employee < ApplicationRecord

  has_many :task_employees
  has_many :tasks, through: :task_employees 

  validates :name, presence: true
  validates :last_name, presence: true
  validates :document, presence: true, uniqueness: true
  validates :mobile, presence: true, uniqueness: true
end
