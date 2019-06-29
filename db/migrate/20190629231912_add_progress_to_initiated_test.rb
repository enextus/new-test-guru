class AddProgressToInitiatedTest < ActiveRecord::Migration[5.2]
  def change
    add_column :initiated_tests, :progress, :integer, null: false, default: 0 
  end
end
