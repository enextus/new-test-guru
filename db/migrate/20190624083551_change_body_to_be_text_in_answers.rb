class ChangeBodyToBeTextInAnswers < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :body, :text
  end
end
