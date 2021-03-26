class BadgeUser < ApplicationRecord
  belongs_to :badge
  belongs_to :user
  belongs_to :test_passage

  after_initialize :badge_info

  def badge_info
    #byebug
  end
end
