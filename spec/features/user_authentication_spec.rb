require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
    visit '/'
    expect(page).to_not have_content('New Post')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  scenario 'logs in successfully from the navbar' do
    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('New Post')
    expect(page).to have_content('Logout')
  end
  scenario 'can log out from navbar' do
    visit '/'
    click_link 'Logout'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
