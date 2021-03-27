class TestPassage < ApplicationRecord
  TEST_RESULT_SUCCESS = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id', optional: true
  has_many :badge_users
  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
    self.success = true if test_success?
    save!
  end

  def completed?
    current_question.nil?
  end

  def test_result
    (correct_questions / test.questions_count.to_f * 100).floor(2)
  end

  def test_success?
    test_result >= TEST_RESULT_SUCCESS
  end

  def current_question_number
    if next_question || current_question
      test.questions.order(:id).where('id < ?', current_question).count + 1
    else
      test.questions.count
    end
  end

  def report_achevments
    {'category_id' => category_finished?,
     'level' => level_finished?,
     'first_atempt' => first_atempt?} 
  end

  private

  def correct_answers?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question&.id).first
  end

   def category_finished?
    #category_tests = Test.where(category_id: user.passed_tests.select(:category_id))
    user_test_by_category = Test.group(:category_id).where(id: user.passed_tests.pluck(:id)).size
    category_tests = Test.group(:category_id).where(category_id: user.passed_tests.select(:category_id)).size
    category_tests.select{|key,value| user_test_by_category[key]==value }.keys
=begin
    if !category_tests.where.not(id:Test.joins(:test_passages).where(test_passages:{success:true, test_id: category_tests.pluck(:id), user_id:user.id}).pluck(:id))
      test.category.id
    end
=end
  end

  def level_finished?
    user_test_by_level = Test.group(:level).where(id: user.passed_tests.pluck(:id)).size
    tests_by_level = Test.group(:level).where(level: user.passed_tests.select(:level)).size
    tests_by_level.select{|key,value| user_test_by_level[key]==value }.keys
=begin 
    level = user.passed_tests.pluck(:level)
    tests=Test.where(level:level)
    if !tests.where.not(id: Test.joins(:test_passages).where(test_passages:{success:true, user_id: user.id}, tests:{level: level }).pluck(:id)).exists?
      level
    end
=end
  end

  def first_atempt?
    #self.class.where(test_id: test.id, user_id: user.id).order(:updated_at).first.success == true
    self.class.select("DISTINCT ON(test_id) *").order("test_id, updated_at ASC").select{|tp| tp.success==true}.pluck(:test_id)
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end
end
