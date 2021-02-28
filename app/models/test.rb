class Test < ApplicationRecord
  def self.tests_by_category(title)
    category = Category.where(title: title)
    category.map { |category| Test.where(category_id: category.id).order('id DESC') }.flatten.to_a
  end
end
