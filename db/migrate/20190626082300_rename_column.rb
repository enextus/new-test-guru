class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :initiated_tests, :tests_id, :test_id
  end
end
