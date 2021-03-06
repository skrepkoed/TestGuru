class DropTableAuthorships < ActiveRecord::Migration[6.0]
  def change
  	drop_table :authorships
  end
end
