class TestsUsers < ApplicationRecord
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :users
end
