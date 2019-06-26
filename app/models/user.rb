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
