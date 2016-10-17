require 'rails_helper'

feature 'Edits posts' do
  background do
    user = create :user
    post = create(:post, caption: "Test baby test", user_id: user.id)

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  scenario 'can edit an exisiting post that belongs to user' do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit Post')
  end
  # scenario 'a post needs an image to save' do
  #   visit '/'
  #   click_link 'New Post'
  #   fill_in 'post[caption]', with: "I don't need a picture do I??"
  #   click_button 'Create Post'
  #   expect(page).to have_content("Your new post couldn't be created! Please check the form.")
  # end
end
