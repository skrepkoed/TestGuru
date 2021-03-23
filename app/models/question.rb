class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :test_passages, dependent: :destroy

  validates :body, presence: true

  delegate :correct_answers, to: :answers
end
