class TasksEmployee < ApplicationRecord
  belongs_to :task, :employee
end
