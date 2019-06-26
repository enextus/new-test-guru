class AddInitiatedTestsTestsIdAndUserIdNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :initiated_tests, :tests_id, false
    change_column_null :initiated_tests, :user_id, false
  end
end
