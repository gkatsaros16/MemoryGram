require 'rails_helper.rb'

feature 'Unauthenticated user must sign in to access any feature' do
  scenario 'user creates a new post.' do
    visit '/'
    expect(current_path).to have_content("users/sign_in")
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
  scenario 'user clicks a button' do
    visit '/'
    click_link('MyStream')
    expect(current_path).to have_content("users/sign_in")
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
  scenario 'user attempts to type in url' do
    visit 'posts/index'
    expect(current_path).to have_content("users/sign_in")
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
