class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :user

  scope :simple, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, -> (level) { joins("INNER JOIN tests_users ON tests_users.test_id = tests.id").where(level: level) }
  scope :by_category, -> (category_title) { joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = :category_title", category_title: category_title) }

  validates :title, presence: true, uniqueness: { scope: :level, message: 'both title, level with same values should happen once per db' }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
end
