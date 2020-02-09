require 'rails_helper'

feature 'User answers survey' do
  scenario 'with survey not answerd before' do
    user = User.create(name: 'Test User')
    question = Question.create(content: 'Test?', user: user)

    visit root_path
    click_link 'Test?'

    expect(page).to have_content("0%\nYes's")
    expect(page).to have_content("0%\nNo's")

    click_link 'YES'

    expect(page).to have_content("100%\nYes's")
    expect(page).to have_content("0%\nNo's")

    click_link 'NO'

    expect(page).to have_content("0%\nYes's")
    expect(page).to have_content("100%\nNo's")
  end
end
