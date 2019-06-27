class Test < ApplicationRecord
  def self.listing_by_category_name(category_name)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id AND categories.title = '#{category_name}' ORDER BY tests.title DESC").pluck(:title)
  end
end
