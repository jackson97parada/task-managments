class CreatePermissionRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :permission_roles do |t|
      t.references :role, null: false, foreign_key: true
      t.string :permission

      t.timestamps
    end
  end
end
