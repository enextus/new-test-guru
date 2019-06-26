class CreateInitiatedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :initiated_tests do |t|
      t.references :tests, foreign_key: true, null: false
      t.references :users, foreign_key: true, null: false

      t.timestamps
    end
  end
end
