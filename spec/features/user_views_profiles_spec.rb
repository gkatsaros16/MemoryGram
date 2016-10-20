require 'rails_helper'

feature 'viewing user profiles' do
  before do
    @user = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user_id: @user.id)
    @post_2 = FactoryGirl.create(:post, user_id: @user_2.id, caption: "no limits")
    sign_in_with @user
    visit '/'
    first(:link, @user.user_name).click
  end

  scenario 'visiting a profile page shows the user name in the url' do
    expect(current_path).to eq(profile_path(@user.user_name))
  end

  scenario "a profile page only shows the specified user's posts" do
    expect(page).to have_css("img[src*='tester']")
    expect(page).to_not have_content(@post_2.caption)
  end
end
