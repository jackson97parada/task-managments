class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :status, default: 0
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
