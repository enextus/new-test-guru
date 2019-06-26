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
