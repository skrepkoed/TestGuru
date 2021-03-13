class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable
  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test
  has_many :created_tests, class_name: 'Test'

  def completed_tests(level)
    passed_tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
