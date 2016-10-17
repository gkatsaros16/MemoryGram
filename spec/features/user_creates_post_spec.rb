require 'rails_helper'

feature 'Creating posts' do
  background do
    user = create :user
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  scenario 'can create a new post' do
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/tester.jpg")
    fill_in 'post[caption]', with: "check check #tester"
    click_button 'Create Post'
    expect(page).to have_content("#tester")
    expect(page).to have_css("img[src*='tester']")
  end
  scenario 'a post needs an image to save' do
    visit '/'
    click_link 'New Post'
    fill_in 'post[caption]', with: "I don't need a picture do I??"
    click_button 'Create Post'
    expect(page).to have_content("Your new post couldn't be created! Please check the form.")
  end
end
