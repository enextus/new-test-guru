class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users

  def self.listing_by_category_title(category_title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = :category_title", category_title: category_title).order(title: :desc).pluck(:title)
  end
end
