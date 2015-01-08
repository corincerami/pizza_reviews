require "rails_helper"

feature "admin can delete users", %{
  As a admin
  I want to delete users
  So that I can delete bad users

  Acceptance Criteria
  * Admin must be able to delete users from admin panel
  } do

  scenario "Admin deletes user" do
    FactoryGirl.create_list(:user, 10)
    admin = FactoryGirl.create(:user, admin: true)

    sign_in(admin)

    visit admin_users_path

    first(".user").click_link("Delete user")

    expect(page).to have_content "User deleted"
    expect(User.count).to eq 10
  end
end
