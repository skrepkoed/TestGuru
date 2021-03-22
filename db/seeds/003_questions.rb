class QuestionSeed
  def self.seed(number, test_id)
    data = []
    number.times do
      data << { body: Faker::Lorem.question(word_count: 3, supplemental: true), test_id: test_id }
    end
    data
  end
end
