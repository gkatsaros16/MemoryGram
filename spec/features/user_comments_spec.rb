# Create a user
# Create a post  belonging to that user
# Sign in as that user
# Visit the root route
# Find the first comment box and write ';P'
# Click the 'Submit' button
# Expect the page to contain your brilliant comment
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
