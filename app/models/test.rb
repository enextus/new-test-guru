class Test < ApplicationRecord
  def self.listing_by_category(category_name)
    ids = Category.where(title: category_name).ids
    Test.where("category_id = :category_id", category_id: ids).order(title: :desc).pluck(:title)
  end
end
