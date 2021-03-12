class TestPassage < ApplicationRecord
  TEST_RESULT_SUCCESS = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: 'question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answers?(answer_ids)
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
    test.questions.order(:id).where('id < ?', current_question).count + 1
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
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end
end
