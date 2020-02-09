require 'rails_helper'

describe QuestionsController, type: :controller do
  describe '#index' do
    context 'with questions' do
      before do
        user = User.create(name: 'Test')
        Question.create(content: "test1?", user: user)
        Question.create(content: "test2?", user: user)
        Question.create(content: "test3?", user: user)
        Question.create(content: "test4?", user: user)
        Question.create(content: "test5?", user: user)
        get :index
      end

      it 'returns success' do
        expect(response).to be_successful
      end
    end
  end

  describe '#create' do
    context 'valid input' do
      before do
        post :create, params: {question: {content: 'test?'}}
      end

      it 'redirects to question page' do
        question = Question.first
        expect(response).to redirect_to(question_path(question))
      end
    end

    context 'empty input' do
      before do
        post :create, params: {question: {content: ''}}
      end

      it 'does not save question' do
        expect(Question.count).to eq(0)
      end
    end
  end
end
