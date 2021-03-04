class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_one :authorship
  has_many :passed_users, through: :tests_users, source: :user
  has_one :author, through: :authorship, source: :user
  def self.tests_by_category(title)
    joins(:category).where('categories.title=?',title)
  end
end
