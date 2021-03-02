class TestUserSeed
  def self.seed(tests_number)
    User.select(:id).each do |user|
      tests_number.times do
        TestsUser.create(test_id: Test.select(:id).order('RANDOM()').first.id, user_id: user.id)
      end
    end
  end
end
