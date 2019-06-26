class User < ApplicationRecord
  def tests_by_level(level)
    user_id = self.id
    ids_of_initiated_tests_of_this_user = InitiatedTest.where(user_id: user_id).pluck(:test_id)
    @arr = []
    ids_of_initiated_tests_of_this_user.map do |id|
      @arr << Test.where("id = :id AND level = :level", id: id, level: level)
    end
  end
end

# irb(main):025:0> reload!
# Reloading...
# => true
# irb(main):026:0> u = User.last
#   User Load (0.4ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT $1  [["LIMIT", 1]]
# => #<User id: 3, name: "max", admin: false, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 18:56:48">
# irb(main):027:0> u.tests_by_level(3)
#    (0.6ms)  SELECT "initiated_tests"."test_id" FROM "initiated_tests" WHERE "initiated_tests"."user_id" = $1  [["user_id", 3]]
#   Test Load (0.6ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.3ms)  SELECT  "tests".* FROM "tests" WHERE (id = 2 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.3ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.3ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.3ms)  SELECT  "tests".* FROM "tests" WHERE (id = 2 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.3ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.3ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.3ms)  SELECT  "tests".* FROM "tests" WHERE (id = 2 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.2ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
# => [[#<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>, #<ActiveRecord::Relation [#<Test id: 2, title: "Test for category: Backend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 18:56:48", category_id: 2>]>, #<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>], [#<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>, #<ActiveRecord::Relation [#<Test id: 2, title: "Test for category: Backend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 18:56:48", category_id: 2>]>, #<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>], [#<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>, #<ActiveRecord::Relation [#<Test id: 2, title: "Test for category: Backend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 18:56:48", category_id: 2>]>, #<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>]]
# irb(main):028:0>
