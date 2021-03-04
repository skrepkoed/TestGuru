class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_answers, ->{where(correct:true)}
  validates :body, presence:true
end
