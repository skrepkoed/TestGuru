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

  def define_badges
    report = {:category_id => category_finished?,
              :level => level_finished?,
              :first_atempt => first_atempt?
              } 
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
    category_tests = test.category.tests
    if !category_tests.where.not(id:Test.joins(:test_passages).where(test_passages:{success:true, test_id: category_tests.pluck(:id), user_id:user.id}).pluck(:id)).exists?
      test.category
    end
  end

  def level_finished?
    level = test.level
    case level
    when 0..1 then tests = Test.easy
    when 2..4 then tests = Test.middle
    when 5..Float::INFINITY then tests = Test.hard
    end
    if !tests.where.not(id: Test.joins(:test_passages).where(test_passages:{success:true, user_id: user.id}, tests:{level: level }).pluck(:id)).exists?
      level
    end
  end

  def first_atempt?
    self.class.where(test_id: test.id, user_id: user.id).order(:updated_at).first.success == true
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end
end
