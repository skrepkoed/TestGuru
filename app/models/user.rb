class User < ApplicationRecord
  def completed_tests(level)
    Test.joins('JOIN tests_users ON tests.id=tests_users.test_id').where('level=? AND user_id=?', level, id)
  end
end
