class Test < ApplicationRecord
  def self.listing_of_tests_by_category_name(category_name)
    ids = Category.where(title: category_name).ids
    Test.where("category_id = :category_id", category_id: ids).order(title: :desc).pluck(:title)
  end
end

# irb(main):005:0> pp Test.listing_of_tests_by_category_name('Frontend')
#    (0.4ms)  SELECT "categories"."id" FROM "categories" WHERE "categories"."title" = $1  [["title", "Frontend"]]
#    (0.5ms)  SELECT "tests"."title" FROM "tests" WHERE (category_id = 1) ORDER BY "tests"."title" DESC
# ["3. Test for category: Frontend",
#  "2. Test for category: Frontend",
#  "1. Test for category: Frontend"]
# => ["3. Test for category: Frontend", "2. Test for category: Frontend", "1. Test for category: Frontend"]
# irb(main):006:0>
