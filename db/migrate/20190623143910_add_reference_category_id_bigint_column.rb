class AddReferenceCategoryIdBigintColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tests, :category, foreign_key: {to_table: :categories})
  end
end
