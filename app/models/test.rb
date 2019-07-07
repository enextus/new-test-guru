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

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level, message: 'both title, level with same values should happen once per db' }, on: :create, on: :update
end
