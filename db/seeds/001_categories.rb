class CategorySeed
  def self.seed(number)
    data = []
    number.times { data << { title: Faker::Educator.subject } }
    data
  end
end
