class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false, limit: 45
      t.string :last_name, null: false, limit: 45
      t.string :document, null: false, unique: true
      t.string :mobile, null: false, unique: true, limit: 10
      t.float :salary
      t.boolean :enable
      t.timestamps
    end
  end
end
