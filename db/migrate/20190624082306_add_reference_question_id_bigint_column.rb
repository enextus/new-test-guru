class AddReferenceQuestionIdBigintColumn < ActiveRecord::Migration[5.2]
  def change
    add_reference(:answers, :question, foreign_key: {to_table: :questions})
  end
end
