class User < ApplicationRecord
  has_many :tests_users
  has_many :passed_tests, through: :tests_users, source: :test
  has_many :authorships
  has_many :test_authorships, through: :authorships, source: :test
  def completed_tests(level)
    tests.where(level:level)
  end
end
