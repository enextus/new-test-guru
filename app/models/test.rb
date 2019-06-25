class Test < ApplicationRecord
  def self.listing_by_category(category_name)
      Test.where(category_id: Category.where(title: category_name).ids).order(title: :desc).pluck(:title)
  end
end
