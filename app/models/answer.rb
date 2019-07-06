class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers_quantity, on: :create

  private

  def validate_max_answers_quantity
    errors.add(:base, 'the maximum quantity of answers (4) for one question was reached') if Answer.where(question_id: question.id).count >= 4
  end
end
