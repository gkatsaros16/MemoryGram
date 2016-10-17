feature 'editing user profiles' do
  background do
    @user = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user_id: @user.id)
    @post_2 = FactoryGirl.create(:post, user_id: @user_2.id, caption: "no limits")
    sign_in_with @user
    visit '/'
  end

  scenario 'a user can change their own profile details' do
    first(:link, @user.user_name).click
    expect(page).to have_content('Edit Profile')
    click_link 'Edit Profile'
    attach_file('user[avatar]', "spec/files/images/tester.jpg")
    fill_in 'user[bio]', with: "Now we really doing it boy!!"
    click_button 'Update Profile'

    expect(current_path).to eq(profile_path(@user.user_name))
    expect(page).to have_css("img[src*='tester']")
    expect(page).to have_content("Now we really doing it boy!!")
  end

  scenario 'a user cannot change someone elses profile picture' do
    first(:link, @user_2.user_name).click

    expect(page).to_not have_content('Edit Profile')
  end

  scenario "a user cannot navigate directly to edit a users profile" do
    visit edit_profile_path(@user_2)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("That profile doesn't belong to you!")
  end
end
