class CreateUsersAndOauthTokens < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
      t.string :moves_user_id, null: false
    end

    create_table :oauth_tokens do |t|
      t.timestamps
      t.references :user, null: false
      t.string :access_token, null: false
      t.string :refresh_token
      t.datetime :expires_at, null: false
    end
  end
end
