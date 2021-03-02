class AddDeafaultToTestLevel < ActiveRecord::Migration[6.0]
  def up
    change_column_default :tests, :level, 1
  end

  def down
    change_column_default :tests, :level, nil
  end
end
