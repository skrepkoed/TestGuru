class AllowNullToQuextionsAndAnswers < ActiveRecord::Migration[6.0]
  def  up
  	change_column :questions, :test_id, :integer, null:true
  	change_column :answers, :question_id, :integer, null:true
  end

  def down
  	change_column :questions, :test_id, :integer
  	change_column :answers, :question_id, :integer
  end
end
