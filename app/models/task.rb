class Task < ApplicationRecord
  enum status: { actived: 0, disabled: 1 }

  belongs_to :tag
  has_many :task_assignments, dependent: :destroy
  has_many :employees, through: :task_assignments

  validates :title, :start_date, :end_date, presence: true
end
