class AddForeignKeyToAnswers < ActiveRecord::Migration[6.0]
  def change
  	add_foreign_key :answers, :questions
  end
end
