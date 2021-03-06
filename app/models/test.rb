class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :passed_users, through: :tests_users, source: :user
  # belongs_to :author, class_name:'User'
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_with_category, -> { joins(:category) }

  validates :title, presence: true, uniqueness: { scope: :level, message: 'Title and level combination must be unique' }
  validates :level, numericality: { only_integer: true }

  def self.tests_by_category(title)
    tests_with_category.where('categories.title=?', title).order(title: :desc).pluck(:title)
  end
end
