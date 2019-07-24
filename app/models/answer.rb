class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_max_answers_quantity, on: :create

  private

  def validate_max_answers_quantity
    puts "2. question = #{question.inspect}, question.id = #{question.id} "
    errors.add(:question_id, 'has a maximum count of answers equal to 4. It is reached.') if Answer.where(question_id: question.id).count >= 4
  end
end
