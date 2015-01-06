require "rails_helper"

feature "user profile", %{
  As a user
  I want to edit account
  So that I can update my information

   Acceptance Criteria
   * My new username should appear on my profile and comments/reviews
   * I must provide a valid username, email, and password
   * I can sign in with my new password
   * I am presented with an error if I enter invalid information
   * If I view my own profile there is a link to edit it
   * A user may not edit a profile that is not their own
  } do

  let(:user) { FactoryGirl.create(:user) }

  scenario "user may edit their own profile" do
    sign_in user

    visit edit_user_registration_path

    fill_in "Username", with: user.username
    fill_in "First name", with: "Liz"
    fill_in "Last initial", with: "V"
    fill_in "Email", with: user.email
    fill_in "Current password", with: user.password
    fill_in "Bio", with: "This is my awesome BIO!!!!!!"
    attach_file("Avatar", "spec/images/avatar.png")
    click_button "Update"

    expect(page).to have_content("Your account has been updated successfully")

    visit user_path(user)

    expect(page).to have_content "Liz V."
    expect(page).to have_selector("img[alt=\"#{user.username}\"]")
  end
end
