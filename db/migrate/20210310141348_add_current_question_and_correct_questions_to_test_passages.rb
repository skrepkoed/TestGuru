class AddCurrentQuestionAndCorrectQuestionsToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_passages, :question, foreign_key: true
    add_column :test_passages, :correct_questions, :integer, default: 0
  end
end
