require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link('Register')
  end
  scenario 'Ability to create a new user via the redirected page' do
    fill_in 'User Name', with: 'Ghoul'
    fill_in 'Email', with: 'Kaneki3@tokyoghoul.com'
    fill_in 'Password', with: 'cochelealevelsecurity'
    fill_in 'Confirm Password', with: 'cochelealevelsecurity'
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  scenario 'Error shows when all information is not supplied' do
    click_button('Sign up')
    expect(page).to have_content("can't be blank")
  end
  scenario 'Error shows when required information is not supplied' do
    fill_in 'Email', with: 'Kaneki@tokyoghoul.com'
    fill_in 'Password', with: 'cochelealevelsecurity'
    fill_in 'Confirm Password', with: 'cochelealevelsecurity'
    click_button('Sign up')
    expect(page).to have_content('Please review the problems below:')
  end
  scenario 'Error shows when required information is not sufficient' do
    fill_in 'User Name', with: 'Gho'
    fill_in 'Email', with: 'Kaneki@tokyoghoul.com'
    fill_in 'Password', with: 'cochelealevelsecurity'
    fill_in 'Confirm Password', with: 'cochelealevelsecurity'
    click_button('Sign up')
    expect(page).to have_content('is too short')
    expect(page).to have_content('minimum is 4 characters')
  end
  scenario 'Error shows when required information is not sufficient' do
    fill_in 'User Name', with: 'GhoulGhoulGhoul'
    fill_in 'Email', with: 'Kaneki@tokyoghoul.com'
    fill_in 'Password', with: 'cochelealevelsecurity'
    fill_in 'Confirm Password', with: 'cochelealevelsecurity'
    click_button('Sign up')
    expect(page).to have_content('is too long')
    expect(page).to have_content('maximum is 12 characters')
  end
end
