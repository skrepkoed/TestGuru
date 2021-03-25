class Badge < ApplicationRecord
  has_many :users, through: :badge_users
end
