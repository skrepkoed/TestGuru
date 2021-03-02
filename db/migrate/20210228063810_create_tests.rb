class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.text :description
      t.integer :level, null: false
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
