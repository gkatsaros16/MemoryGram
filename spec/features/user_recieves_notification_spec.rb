require 'rails_helper'

feature "post owner receives notification when user comments on post." do
  before do
    @user = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user_id: @user.id)
    sign_in_with @user_2
    visit '/'
    fill_in 'comment[content]', with: 'Nice pic bro.'
    click_button 'Submit Comment'
  end
  scenario 'User should have a new notification' do
    click_link 'Logout'
    sign_in_with @user
    click_button ('dropdownMenu1')
    expect(page).to have_content("#{@user_2.user_name} commented")
  end
  scenario 'Users notification should lead to the posts show page.' do
    click_link 'Logout'
    sign_in_with @user
    click_button ('dropdownMenu1')
    first(:link, "#{@user_2.user_name} commented on your post").click
    expect(current_url).to have_content(post_path(@post))
  end
end
