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

  scenario "vist another user's profile" do
    user = FactoryGirl.create(:user)

    visit user_path(user)
    save_and_open_page

    expect(page).to have_content user.username
    expect(page).to have_content user.bio
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_initial
    # We will need to implement reviews and comments once the models
    # are implemented
  end
end
