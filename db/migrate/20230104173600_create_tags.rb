class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true
      t.string :color
      t.boolean :enable, default: false
      t.timestamps
    end
  end
end
