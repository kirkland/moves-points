class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.timestamps
      t.string :kind, null: false
      t.date :date, null: false
      t.integer :distance, null: false
      t.string :moves_identifier, null: false
      t.references :user, null: false
    end
  end
end
