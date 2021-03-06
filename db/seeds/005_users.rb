class UserSeed
  def self.seed(number)
    data = []
    number.times do
      data << { username: Faker::Internet.username(specifier: 5..8),
                password: Faker::Internet.password, email: Faker::Internet.email }
    end
    data
  end
end
