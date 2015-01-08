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
end
