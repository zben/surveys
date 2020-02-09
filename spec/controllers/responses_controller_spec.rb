require 'rails_helper'

describe ResponsesController, type: :controller do
  describe '#create' do
    before do
      @user = User.create(name: 'Test')
      @question = Question.create(content: 'Test?', user: @user)
    end

    context 'not answered before' do
      it 'saves answer correctly' do
        post :create, params: {question_id: @question.id, answer: 'yes'}

        expect(response).to redirect_to(question_path(@question))
        expect(@question.responses.first.answer).to eq(true)
      end
    end

    context 'answered before with same answer' do
      before do
        @current_user = User.create(name: 'Test User')
        @question_response = @question.responses.create(user: @current_user, answer: true)
      end

      it 'returns success with no op' do
        post :create, params: {question_id: @question.id, answer: 'yes'}

        expect(response).to redirect_to(question_path(@question))
        expect(Response.count).to eq(1)
        expect(@question_response.reload.answer).to eq(true)
      end
    end

    context 'answered before with different answer' do
      before do
        @current_user = User.create(name: 'Test User')
        @question_response = @question.responses.create(user: @current_user, answer: false)
      end

      it 'updates answer and returns success' do
        post :create, params: {question_id: @question.id, answer: 'yes'}

        expect(response).to redirect_to(question_path(@question))
        expect(Response.count).to eq(1)
        expect(@question_response.reload.answer).to eq(true)
      end
    end
  end
end
