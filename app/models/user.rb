class User < ApplicationRecord
  def tests_by_level(level)
    user_id = self.id
    tests_ids_by_this_user = InitiatedTest.where(user_id: user_id).pluck(:test_id)

    @arr = []

    tests_ids_by_this_user.map do |id|
      @arr << Test.where("id = :id AND level = :level", id: id, level: level)
    end

    @arr
  end
end


# irb(main):416:0> u1 = User.last
#   User Load (0.3ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT $1  [["LIMIT", 1]]
# => #<User id: 3, name: "max", admin: false, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 18:56:48">
# irb(main):417:0>
# irb(main):418:0>
# irb(main):419:0>
# irb(main):420:0> u1.tests_by_level(3)
#    (0.4ms)  SELECT "initiated_tests"."test_id" FROM "initiated_tests" WHERE "initiated_tests"."user_id" = $1  [["user_id", 3]]
#   Test Load (0.6ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.5ms)  SELECT  "tests".* FROM "tests" WHERE (id = 2 AND level = 3) LIMIT $1  [["LIMIT", 11]]
#   Test Load (0.4ms)  SELECT  "tests".* FROM "tests" WHERE (id = 1 AND level = 3) LIMIT $1  [["LIMIT", 11]]
# => [#<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>, #<ActiveRecord::Relation [#<Test id: 2, title: "Test for category: Backend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 18:56:48", category_id: 2>]>, #<ActiveRecord::Relation [#<Test id: 1, title: "1. Test for category: Frontend", level: 3, created_at: "2019-06-25 18:56:48", updated_at: "2019-06-25 19:46:55", category_id: 1>]>]
