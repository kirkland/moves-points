class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.timestamps
      t.date :date, null: false
      t.references :user, null: false

      t.integer :bicycling_distance, null: false
      t.integer :running_distance, null: false
      t.integer :walking_distance, null: false
    end
  end
end
