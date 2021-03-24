class AddUnderConstructionColumnToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :under_construction, :boolean
  end
end
