Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions

  post 'questions/:question_id/responses/:answer',
    to: 'responses#create', as: 'add_or_update_response'
end
