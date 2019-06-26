class User < ApplicationRecord
  def tests_by_level(level)
    user_id = self.id
    ids_arr = InitiatedTest.where(user_id: user_id).pluck(:test_id)

    # pp ids_arr
    # [1, 2, 3]

    # objs_arr = Test.find(ids_arr)

    objs_arr = Test.where("id = :ids_arr", ids_arr: ids_arr)

    pp objs_arr

    pp objs_arr_level = Test.where("level = :level", level: level)
  end
end
