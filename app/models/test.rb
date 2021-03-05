class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :passed_users, through: :tests_users, source: :user
  belongs_to :user
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, ->(title) { joins(:category).where('categories.title=?', title).order(title: :desc) }
  validates :title, presence: true
  validates :level, numericality: { only_intger: true }
  validates :title, uniqueness: { scope: :level, message: 'Title and level combinztion must be unique' }
end
