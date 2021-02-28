class TestUserSeed
  def self.seed(tests_number)
    connection = ActiveRecord::Base.connection()
    User.select(:id).each do |user|
      tests_number.times do
        sql = format('INSERT INTO tests_users (test_id,user_id) VALUES (%<test_id>d, %<user_id>d)',
                     test_id: Test.all.sample.id, user_id: user.id)
        connection.execute(sql)
      end
    end
  end
end
