class CreateJoinTableUserTest < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests do |t|
      t.index :user_id
      t.index :test_id
    end
  end
end
