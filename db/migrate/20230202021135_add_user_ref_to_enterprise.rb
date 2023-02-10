class AddUserRefToEnterprise < ActiveRecord::Migration[7.0]
  def change
    add_reference :enterprises, :user, null: false, foreign_key: true
  end
end
