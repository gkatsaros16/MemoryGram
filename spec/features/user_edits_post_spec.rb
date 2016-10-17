require 'rails_helper'

feature 'Edits posts' do
  background do
    @user = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/tester.jpg")
    fill_in 'post[caption]', with: "check check #tester"
    click_button 'Create Post'
    @post = Post.last
  end
  scenario 'User can edit an exisiting post that belongs to user' do
    visit post_path(@post)
    expect(page).to have_content('Edit Post')
    click_link 'Edit Post'
    fill_in "post[caption]", with: "This is what i really wanted."
    click_button 'Update Post'
    expect(page).to have_content('Updated successfully!')
    expect(page).to have_content('This is what i really wanted.')
  end
  scenario "User is unable to see edit link on a post that's not yours" do
    click_link ('Logout')
    visit '/'
    fill_in 'Email', with: @user_2.email
    fill_in 'Password', with: @user_2.password
    click_button 'Log in'
    visit post_path(@post)
    expect(page).to_not have_content('Edit Post')
  end
  scenario "User is unable to see edit view by typing the url of a post that's not yours" do
    click_link ('Logout')
    visit '/'
    fill_in 'Email', with: @user_2.email
    fill_in 'Password', with: @user_2.password
    click_button 'Log in'
    visit edit_post_path(@post)
    expect(page).to have_content("That post doesn't belong to you!")
  end
  scenario "User is able to see delete their own post" do
    visit edit_post_path(@post)
    click_button 'Delete Post'
    expect(page).to have_content('Post successfully deleted!')
    expect(page).to_not have_content('check check #tester')
  end
end
