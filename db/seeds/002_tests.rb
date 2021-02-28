class TestSeed
  def self.seed(number, category_id)
    data = []
    number.times do
      data << { title: THEMES.sample.name, level: LEVELS.sample,
                category_id: category_id }
    end
    data
  end
  THEMES = [Faker::ProgrammingLanguage, Faker::GreekPhilosophers]
  LEVELS = [*1..10]
end
