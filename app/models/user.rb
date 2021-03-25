class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable
  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test
  has_many :created_tests, class_name: 'Test'
  has_many :badges, through: :badge_suers

  def completed_tests(level)
    passed_tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      'Stranger'
    end
  end
end
