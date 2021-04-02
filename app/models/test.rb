class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :passed_users, through: :test_passages, source: :user
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :tests_for_passing, -> { where(under_construction: false) }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_with_category, -> { joins(:category) }

  before_validation :test_correctness
  validates :title, presence: true, uniqueness: { scope: :level, message: 'Title and level combination must be unique' }
  validates :level, numericality: { only_integer: true }

  def self.tests_by_category(title)
    tests_with_category.where('categories.title=?', title).order(title: :desc).pluck(:title)
  end

  def time_for_passage_in_sec
    time_for_passage*60 if time_for_passage
  end

  def correct_test?
    !(questions.empty? || questions.left_outer_joins(:answers).exists?(answers: { id: nil }))
  end

  def test_correctness
    self.under_construction = true unless correct_test?
  end

  delegate :count, to: :questions, prefix: true
end
