class AddNotNullToQuestions < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :questions, :test_id, false
  	change_column_null :questions, :body, false
  end
end
