class User < ApplicationRecord

  def tests_by_level(level)
    user_id = self.id
    InitiatedTest.where(user_id: user_id).pluck(:test_id).map do |id|
      Test.where("id = :id AND level = :level", id: id, level: level).first
    end
  end
end

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
