require "rails_helper"

feature "user profile", %{
  As a user
  I want to view a user's profile
  So I can learn more about them
  } do
    # Acceptance Criteria
    # * The profile shows the user's username
    # * The profile optionally shows the user's bio,
    #   first name, and last initial
    # * The profile shows the user's reviews
    # * The profile shows the user's comments
    # * If I view my own profile there is a link to edit it
    # * A user may not edit a profile that is not their own

  let(:user) { FactoryGirl.create(:user) }

  scenario "vist another user's profile" do
    visit user_path(user)

    expect(page).to have_content user.username
    expect(page).to have_content user.bio
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_initial
    expect(page).to_not have_content "Edit Profile"
    # We will need to implement reviews and comments once the models
    # are implemented
  end

  scenario "user visits his/her own profile" do

    sign_in user

    visit user_path(user)

    expect(page).to have_content user.username
    expect(page).to have_content user.bio
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_initial
    expect(page).to have_content "Edit Profile"
  end
end
