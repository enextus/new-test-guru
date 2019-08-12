class AddReferenceUserIdBigintColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tests, :user, foreign_key: {to_table: :users})
  end
end
