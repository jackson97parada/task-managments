class AddEnterpriseRefToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :enterprise, foreign_key: true
  end
end
