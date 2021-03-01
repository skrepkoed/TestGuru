# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative './seeds/001_categories'
require_relative './seeds/002_tests'
require_relative './seeds/003_questions'
require_relative './seeds/004_answers'
require_relative './seeds/005_users'
require_relative './seeds/006_test_user'

categories=Category.create(CategorySeed.seed(5))
categories.each { |category| Test.create(TestSeed.seed(5, category.id)) }
Test.select(:id).each { |test| Question.create(QuestionSeed.seed(10, test.id)) }
Question.select(:id).each { |question| Answer.create(AnswerSeed.seed(4, question.id)) }
User.create(UserSeed.seed(10))
TestUserSeed.seed(3)
