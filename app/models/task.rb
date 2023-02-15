class Task < ApplicationRecord
  enum status: { actived: 0, disabled: 1 }

  belongs_to :tag
  belongs_to :enterprise
  
  has_many :task_assignments, dependent: :destroy
  has_many :employees, through: :task_assignments

  validates :title, :start_date, :end_date, presence: true

  accepts_nested_attributes_for :employees
end
