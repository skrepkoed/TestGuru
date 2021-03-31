class RemoveColumnTestPassageIdFromBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :badge_users, :test_passage_id, :references
  end
end
