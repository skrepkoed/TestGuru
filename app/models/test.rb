class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  has_one :user, through: :authorships
  def self.tests_by_category(title)
    joins('JOIN categories ON tests.category_id=categories.id').where('categories.title=?', title)
  end
end
