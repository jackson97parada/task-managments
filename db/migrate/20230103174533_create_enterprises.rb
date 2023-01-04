class CreateEnterprises < ActiveRecord::Migration[7.0]
  def change
    create_table :enterprises do |t|
      t.string :nit, null: false, unique: true
      t.string :direction
      t.string :mobile, null: false, unique: true
      t.boolean :enable
      t.timestamps
    end
  end
end
