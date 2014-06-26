class AddSkateboardingDistance < ActiveRecord::Migration
  def change
    add_column :summaries, :skateboarding_distance, :integer, default: 0, null: false
  end
end
