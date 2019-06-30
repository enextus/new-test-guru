class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def tests_by_level(level)
      Test.joins("INNER JOIN tests_users ON tests_users.test_id = tests.id").where(level: level)
  end
end
