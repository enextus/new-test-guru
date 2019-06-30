class AddColumnToTestsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tests_users, :progress, :integer
  end
end
