class TestSeed
  def self.seed(number, category_id, author)
    data = []
    number.times do
      data << { title: THEMES.sample.name, level: LEVELS.sample,
                category_id: category_id, user_id: author }
    end
    data
  end
  THEMES = [Faker::ProgrammingLanguage, Faker::GreekPhilosophers]
  LEVELS = [*1..10]
end
