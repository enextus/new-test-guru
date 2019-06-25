class Test < ApplicationRecord
  def self.tests_listing_by_category_name(category_name)
    ids = Category.where("title = :title", title: category_name).ids
    Test.where("category_id = :category_id", category_id: ids).order(title: :desc).pluck(:title)
  end
end

# irb(main):012:0> pp Test.tests_listing_by_category_name('Frontend')
#    (0.6ms)  SELECT "categories"."id" FROM "categories" WHERE (title = 'Frontend')
#    (0.8ms)  SELECT "tests"."title" FROM "tests" WHERE (category_id = 1) ORDER BY "tests"."title" DESC
# ["3. Test for category: Frontend",
#  "2. Test for category: Frontend",
#  "1. Test for category: Frontend"]
# => ["3. Test for category: Frontend", "2. Test for category: Frontend", "1. Test for category: Frontend"]
