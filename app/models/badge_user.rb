class BadgeUser < ApplicationRecord
  belongs_to :badge
  belongs_to :user
  belongs_to :test_passage
end
