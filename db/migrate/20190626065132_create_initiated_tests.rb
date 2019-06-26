class CreateInitiatedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :initiated_tests do |t|
      t.bigint :tests_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
