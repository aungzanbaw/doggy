class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, [:phone,:auth_token] , unique: true
  end
end
