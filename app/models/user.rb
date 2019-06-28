class User < ApplicationRecord
  def tests_by_level(level = 0)

    # h = { level: level }
    # pp h[:level]

      Test.joins("INNER JOIN initiated_tests ON initiated_tests.test_id = tests.id").where(level: level)
  end
end
