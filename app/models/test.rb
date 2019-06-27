class Test < ApplicationRecord
  def self.listing_by_category_name(category_name)


  end
end

# SELECT tests.title
# FROM categories
# INNER JOIN tests
# ON tests.category_id = categories.id AND categories.title = 'Frontend'
# ORDER BY tests.title DESC;
#              title
# --------------------------------
#  3. Test for category: Frontend
#  2. Test for category: Frontend
#  1. Test for category: Frontend
# (3 rows)
