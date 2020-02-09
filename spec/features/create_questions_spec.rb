require 'rails_helper'

feature 'User creates survey' do
  before do
    visit root_path
    click_link 'Create New Survey'
  end

  scenario 'with valid input' do
    fill_in 'question_content', with: 'Does this work?'
    click_button 'Create Survey'

    expect(page).to have_content('Does this work?')
    expect(page).to have_content('YES')
    expect(page).to have_content('NO')

    click_link 'Back to all surveys'

    expect(page).to have_content('Does this work?')
  end

  scenario 'with empty input' do
    fill_in 'question_content', with: ''
    click_button 'Create Survey'

    expect(page).to have_content("Content can't be blank")
  end
end
