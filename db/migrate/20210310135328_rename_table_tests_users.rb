class RenameTableTestsUsers < ActiveRecord::Migration[6.0]
  def change
  	rename_table :tests_users, :test_passages
  end
end
