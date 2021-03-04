class CreateJoinTableTestsAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authorships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true, index: {unique: true}
    end
  end
end
