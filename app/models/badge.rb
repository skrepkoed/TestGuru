class Badge < ApplicationRecord
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }, allow_blank: true

  def self.search_badge(report)
    all.select do |badge|
      badge_attributes = badge.badge_attributes(report)
      badge_attributes == badge_attributes.select do |key, value|
        report[key].include?(value)
      end
    end
  end

  def badge_attributes(report)
    keys_to_extract = report.keys
    attributes.select { |key, value| keys_to_extract.include?(key) && value }
  end
end
