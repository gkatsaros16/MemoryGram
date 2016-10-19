require 'rails_helper'

feature "user is able to comment on posts." do
  background do
    @user = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    sign_in_with @post.user
    visit '/'
    fill_in 'comment[content]', with: 'Nice pic bro.'
    click_button 'Submit Comment'
  end
  scenario 'user commented on a post.' do
    expect(page).to have_content('Nice pic bro.')
  end
end

#not finished
