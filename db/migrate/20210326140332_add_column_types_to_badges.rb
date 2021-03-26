class AddColumnTypesToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :category_id, :integer
    add_column :badges, :level, :integer
    add_column :badges, :first_atempt, :boolean
  end
end
