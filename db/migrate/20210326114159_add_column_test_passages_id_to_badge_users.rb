class AddColumnTestPassagesIdToBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :badge_users, :test_passage, null: false, foreign_key: true
  end
end
