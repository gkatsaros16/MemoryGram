require 'rails_helper'

feature "User likes a post" do
  before do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user_id: @user.id)
    sign_in_with @user
    visit browse_posts_path
  end

  scenario 'can like a post' do
    find(:xpath, "//a[@href='/posts/#{@post.id}/like']").click
    expect(page).to have_content("#{@user.user_name}likes this")
  end

  scenario 'can unlike a post' do
    find(:xpath, "//a[@href='/posts/#{@post.id}/like']").click
    find(:xpath, "//a[@href='/posts/#{@post.id}/unlike']").click
    expect(page).to_not have_content("#{@user.user_name}likes this")
  end
end
