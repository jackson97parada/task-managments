class CreateTasksEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :task_employees do |t|
      t.references :task, :employee, null: false

      t.timestamps
    end
  end
end
