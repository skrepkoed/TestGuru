class Badge < ApplicationRecord
  attr_accessor :report
  has_many :badge_users
  has_many :users, through: :badge_users

  def self.search_badge(report)
    request=''
    report.each do |key, value|
      request+="#{key}=? or "
    end
  end

end
