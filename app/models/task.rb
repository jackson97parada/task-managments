class Task < ApplicationRecord
  enum status: { actived: 0, disabled: 1 }

  belongs_to :tag
  has_many :task_employees
  has_many :employees, through: :task_employees, dependent: :destroy

  validates :title, :start_date, :end_date, presence: true
end
