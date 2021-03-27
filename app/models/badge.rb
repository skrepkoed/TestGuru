class Badge < ApplicationRecord
  attr_accessor :report
  has_many :badge_users
  has_many :users, through: :badge_users

  def self.search_badge(report)
    value = report.values
    byebug
    where("category_id=? OR level=? OR first_atempt=?", *value).select do |badge|
      byebug
      badge_attributes = badge.badge_attributes(report)
      badge_attributes==badge_attributes.select do |key,value|
        report[key].include?(value)
      end
      
    end
  end

  def badge_attributes(report)
    keys_to_extract=report.keys
    attributes.select{|key, value| keys_to_extract.include?(key) && value }
  end

end
