require "rails_helper"

feature "admin can view admin dashboard", %{
  As an admin
  I want to view the admin dashboard
  So that I can have access to admin controls

  Acceptance Criteria
  * Admin must be able to view admin dashboard
  } do

  scenario "admin can view admin dashboard" do
    admin = FactoryGirl.create(:user, admin: true)

    sign_in(admin)

    visit root_path

    click_on "Admin Dashboard"

    expect(page).to have_link("All Users", href: admin_users_path)
    expect(page).to have_link("All Pizzerias", href: admin_pizzerias_path)
    expect(page).to have_link("All Reviews", href: admin_reviews_path)
    expect(page).to have_link("All Comments", href: admin_comments_path)
  end

  scenario "users who are not admins cannot view admin dashboard" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit admin_dashboards_path

    expect(page).to have_content "You are not authorized"
  end

  scenario "user who are not admins do not see Admin Dashboard link" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit root_path

    expect(page).to_not have_content "Admin Dashboard"
  end
end
