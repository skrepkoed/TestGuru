class AddNotNullToUsers < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :users, :username, false
  	change_column_null :users, :password, false
  end
end
