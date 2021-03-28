class AddUniqueCompositIndicesToBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :badge_users, [:badge_id,:user_id], unique:true
  end
end
