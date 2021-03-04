class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_one :authorship
  has_many :passed_users, through: :tests_users, source: :user
  has_one :author, through: :authorship, source: :user
  scope :easy, ->{where(level:0..1)}
  scope :middle, ->{where(level:2..4)}
  scope :hard, ->{where(level:5..Float::INFINITY)}
  scope :tests_by_category, ->(title){joins(:category).where('categories.title=?',title)}
    
end
