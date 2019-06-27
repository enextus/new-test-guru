class User < ApplicationRecord

  def tests_by_level(level)
    user_id = self.id
    InitiatedTest.where(user_id: user_id).pluck(:test_id).map do |id|
      Test.where("id = :id AND level = :level", id: id, level: level).first
    end
  end
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# SELECT tests.title
# FROM tests
# INNER JOIN initiated_tests
# ON initiated_tests.test_id = tests.id AND tests.level = 3
# ;
#              title
# --------------------------------
#  1. Test for category: Frontend
#  1. Test for category: Frontend
#  1. Test for category: Frontend
#  Test for category: Backend
#  1. Test for category: Frontend
#  Test for category: Backend
#  2. Test for category: Frontend
#  Test for category: Backend
#  2. Test for category: Frontend
# (9 rows)
