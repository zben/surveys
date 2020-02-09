require 'rails_helper'

feature 'User visit survey index page' do
  scenario 'with survey with responses' do
    user1 = User.create(name: 'Test User 1')
    user2 = User.create(name: 'Test User 2')
    user3 = User.create(name: 'Test User 3')
    user4 = User.create(name: 'Test User 4')

    question = Question.create(content: 'Test?', user: user1)
    Response.create(user: user1, question: question, answer: true)
    Response.create(user: user2, question: question, answer: true)
    Response.create(user: user3, question: question, answer: true)
    Response.create(user: user4, question: question, answer: false)

    visit root_path

    expect(page).to have_content('Test?')
    expect(page).to have_content("75%\nYes's")
    expect(page).to have_content("25%\nNo's")
  end
end
