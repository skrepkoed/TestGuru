class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.references :test

      t.timestamps
    end
    add_index :tests, :test_id
  end
end
