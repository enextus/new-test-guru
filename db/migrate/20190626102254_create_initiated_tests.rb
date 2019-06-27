class CreateInitiatedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :initiated_tests do |t|
      t.references :test, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
