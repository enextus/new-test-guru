class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :user

  scope :simple, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category_title) { joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = :category_title", category_title: category_title) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  validate :validate_titling_by_the_same_level, on: :create

  private

  def validate_titling_by_the_same_level
    errors.add(:title, 'is the same by this level was found in db, please use an other title') if Test.where(title: title).where(level: level).count.positive?
  end
end

# def validate_max_answers_quantity
#   errors.add(:base, 'the maximum quantity of answers (4) for one question was reached') if Answer.where(question_id: question.id).count >= 4
# end
