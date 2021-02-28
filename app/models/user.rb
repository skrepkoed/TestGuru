class User < ApplicationRecord
  def completed_tests(*level)
    connection = ActiveRecord::Base.connection()
    sql = format('SELECT test_id FROM tests_users WHERE user_id=%<user_id>d', user_id: id)
    user_tests = connection.execute(sql)
    user_tests.map { |test| Test.find(test['test_id']) }.select { |test| level.any?(test.level) }
  end
end
