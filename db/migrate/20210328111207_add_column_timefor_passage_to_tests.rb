class AddColumnTimeforPassageToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time_for_passage, :integer
  end
end
