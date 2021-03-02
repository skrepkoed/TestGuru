class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authorships
  has_many :tests, through: :authorships
  def completed_tests(level)
    Test.joins('JOIN tests_users ON tests.id=tests_users.test_id').where('level=? AND user_id=?', level,
                                                                         id).pluck(:title)
  end
end
