class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question

      t.timestamps
    end
    add_index :questions, :question_id
  end
end
