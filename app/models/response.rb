class Response < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates_uniqueness_of :question_id, scope: :user_id

  after_save :update_response_counts_for_question
  after_destroy :update_response_counts_for_question

  private

  def update_response_counts_for_question
    question.update!(
      yes_count: question.responses.where(answer: true).count,
      no_count: question.responses.where(answer: false).count
    ) if question
  end
end
