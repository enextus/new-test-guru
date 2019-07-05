class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :simple, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..+1.0/0.0) }

  scope :listing_by_category_title, -> (category_title) { joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = :category_title", category_title: category_title).order(title: :desc).pluck(:title) }
end






















# def self.listing_by_category_title(category_title)
#   Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = :category_title", category_title: category_title).order(title: :desc).pluck(:title)
# end

# validates :level, presence: true, numericality: { only_integer: true }, allow_nil: true, if: :ruby_tests?
# validate :validate_max_level, on: :create

# private

# def validate_max_level
#   errors.add(:level) if level.to_i > 10
# end

# def ruby_tests?
#   false
#   # title.match(/ddd/i)
# end

# scope :easy, -> { where(level: 5) }
# scope :easy_backend, -> (level) { easy.where(level: level) }
#
# default_scope { order(created_at: :desc) }

# self.scope( :please_puts_method_name_here, lambda { | | where(level: 0..3).order(created_at: :desc) } )
#
# succ = lambda { |x| x + 1 }
# lambda { |x| x + 1 }.call(23)
# succ.call(2)
#
# succ = ->(x){ x+1 }
# succ.call(2)
#
