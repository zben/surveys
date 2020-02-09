require 'rails_helper'

describe Response, type: :model do
  describe 'associations and validations' do
    it { should belong_to(:question) }
    it { should belong_to(:user) }

    it { should validate_uniqueness_of(:question_id).scoped_to(:user_id) }
  end

  describe 'callbacks' do
    describe 'update_response_counts_for_question' do
      before do
        @user = User.create(name: 'Owner')
        @question = Question.create(content: 'test?', user: @user)

        @user1 = User.create(name: 'User 1')
      end

      context 'on create' do
        it 'updates correct counts on question' do
          @response = @question.responses.create!(user: @user1, answer: true)

          @question.reload

          expect(@question.yes_count).to eq(1)
          expect(@question.no_count).to eq(0)
        end
      end

      context 'on update' do
        it 'updates correct counts on question' do
          @response = @question.responses.create(user: @user1, answer: true)

          @response.update!(answer: false)

          @question.reload

          expect(@question.yes_count).to eq(0)
          expect(@question.no_count).to eq(1)
        end
      end

      context 'on destroy' do
        it 'updates correct counts on question' do
          @response = @question.responses.create!(user: @user1, answer: true)

          @response.destroy!

          @question.reload

          expect(@question.yes_count).to eq(0)
          expect(@question.no_count).to eq(0)
        end
      end
    end
  end
end

