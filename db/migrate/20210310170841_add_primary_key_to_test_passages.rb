class AddPrimaryKeyToTestPassages < ActiveRecord::Migration[6.0]
  def change
  	add_column :test_passages, :id, :primary_key
  end
end
