class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :passsword
      t.string :auth_token

      t.timestamps
    end
  end
end
