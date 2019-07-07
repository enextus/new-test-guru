class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :user

  scope :simple, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (category_title) { joins(:category).where(categories: { title: category_title }) }

  scope :by_author_name, -> (name) { joins(:user).where(users: { name: name }) }

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level, message: 'and level with the corresponding values already exist in the db' }
end
