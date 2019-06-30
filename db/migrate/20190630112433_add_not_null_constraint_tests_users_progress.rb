class AddNotNullConstraintTestsUsersProgress < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tests_users, :progress, false
  end
end
