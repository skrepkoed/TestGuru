class UserSeed
  def self.seed(number)
    data = []
    number.times do
      data << { username: Faker::Internet.username(specifier: 5..8),
                password: Faker::Internet.password }
    end
    data
  end
end
