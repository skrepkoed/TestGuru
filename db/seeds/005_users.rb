class UserSeed
  def self.seed(number)
    data = []
    number.times do
      data << { username: Faker::Internet.username(specifier: 5..8),
                password: 123456, email: Faker::Internet.email }
    end
    data
  end
end
