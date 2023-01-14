class Task < ApplicationRecord
  enum status: { actived: 0, disabled: 1 }

  belongs_to :tag

  validates :title, :start_date, :end_date, presence: true
end
