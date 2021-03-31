class RemoveColumnsFromBadges < ActiveRecord::Migration[6.0]
  def change
    remove_column :badges, :category_id, :integer
    remove_column :badges, :level, :integer
    remove_column :badges, :first_atempt, :integer
    add_column :badges, :rule, :string
    add_column :badges, :value, :string
  end
end
