class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps

      t.string :access_token
      t.string :refresh_token

      t.string :username, limit: 100, null: false
      t.string :salt, limit: 128, null: false
      t.string :encrypted_password, limit: 128, null: false
    end
  end
end
