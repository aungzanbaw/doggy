class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :password
      t.text :auth_token
      t.timestamps :last_login
      t.timestamps
    end
  end
end
