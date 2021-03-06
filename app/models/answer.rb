class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_question_number_answers, on: :create

  private

  def validate_question_number_answers
    if self.class.where(question_id: question_id).count >= 4
      errors.add(:question_id, message: 'Question can contain 4 answers maximum')
    end
  end
end
