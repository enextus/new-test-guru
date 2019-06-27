class User < ApplicationRecord
  def tests_by_level(level)
      Test.joins("INNER JOIN initiated_tests ON initiated_tests.test_id = tests.id").where("level = :level", level: level).pluck(:title)
  end
end
