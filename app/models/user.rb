class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  has_many :created_tests, class_name: "Test"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
