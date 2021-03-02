class AnswerSeed
  def self.seed(number, question_id)
    data = []
    number.times do
      data << { body: Faker::Lorem.sentence(word_count: 3, supplemental: true),
                question_id: question_id }
    end
    data
  end
end
