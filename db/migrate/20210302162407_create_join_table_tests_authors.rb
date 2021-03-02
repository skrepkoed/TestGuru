class CreateJoinTableTestsAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authorships, id: false do |t|
      t.references :user, unique: true, null: false, foreign_key: true
      t.references :test, unique: true, null: false, foreign_key: true
    end
  end
end
