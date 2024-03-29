class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: false, null: false

      t.timestamps
    end
  end
end
