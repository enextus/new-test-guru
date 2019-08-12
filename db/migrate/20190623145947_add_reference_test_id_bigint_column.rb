class AddReferenceTestIdBigintColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference(:questions, :test, foreign_key: {to_table: :tests})
  end
end
