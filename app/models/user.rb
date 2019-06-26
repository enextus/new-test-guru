class User < ApplicationRecord
  def level_check(level)
    @level = level
    puts level
  end

  def tests_by_level(level)
    tests.where('level = :level', level: level )
  end
end
