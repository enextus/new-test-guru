class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def tests_by_level(level)
      Test.joins("INNER JOIN tests_users ON tests_users.test_id = tests.id").where(level: level)
  end
end
