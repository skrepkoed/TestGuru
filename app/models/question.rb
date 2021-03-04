class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates :body, presence:true
  validate :validate_question_number_answers
  
  private

  def validate_question_number_answers
  	errors.add(:answers) unless (1..4).include?(answers.count)
  end
end
