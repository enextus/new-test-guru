class CreateInitiatedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :initiated_tests do |t|
      t.references :test, foreign_key: true, null: false, unique: true
      t.references :user, foreign_key: true, null: false, unique: true

      t.timestamps
    end
  end
end
