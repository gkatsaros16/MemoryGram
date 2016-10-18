feature "User likes a post" do
  background do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user_id: @user.id)
    sign_in_with @user
    visit '/'
  end

  scenario 'can like a post' do
    find(:xpath, "//a[@href='/posts/#{@post.id}/like']").click
    expect(page).to have_content("#{@user.user_name}likes this")
  end
  #complete unliking a picture later!
  scenario 'can unlike a post' do
    # Repeat the above steps.
    # Click the "like" button once more.
    # Expect to see the "unlikes-post" class on the button.
    # Expect to NOT see my name within the "liked by" area of the post
  end
end
