require "rails_helper"

feature "admin views a list of users", %{
  As a admin
  I want to view a list of users
  So that I can view who is using my website

  Acceptance Criteria
  * View a list with all users
  } do

  scenario "view a list of users" do
    admin = FactoryGirl.create(:user, admin: true)
    user = FactoryGirl.create(:user)

    sign_in(admin)

    visit admin_users_path

    expect(page).to have_content user.username
  end

  scenario "unauthorized users are redirected" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit admin_users_path

    expect(page).to have_content "not authorized"
    expect(current_path).to eq(root_path)
  end
end
