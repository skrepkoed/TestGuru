class User < ApplicationRecord
  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test
  has_many :created_tests, class_name: 'Test'

  validates :email, presence: true

  def completed_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
  	test_passages.order(id: :desc).find_by(test_id:test.id)
  end
end
