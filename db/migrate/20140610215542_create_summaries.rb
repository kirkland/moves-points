class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.timestamps
      t.string :kind, null: false
      t.date :date, null: false
      t.integer :distance, null: false
      t.references :user, null: false
    end
  end
end
