require "rails_helper"

feature "admin can delete pizzerias", %{
  As a admin
  I want to delete pizzerias
  So that I can keep content updated

  Acceptance Criteria
  * Admin must be able to delete pizzerias from admin panel
  } do

  scenario "admin can delete a pizzeria" do
    pizzerias = FactoryGirl.create_list(:pizzeria, 10)

    admin = FactoryGirl.create(:user, admin: true)

    sign_in(admin)

    visit admin_pizzerias_path

    first(".pizzeria").click_link("Delete pizzeria")

    expect(page).to have_content "Pizzeria Deleted"
    expect(pizzerias.count).to eq 9
  end

  scenario "unauthorized users are redirected" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit admin_pizzerias_path

    expect(page).to have_content "not authorized"
    expect(current_path).to eq(root_path)
  end
end
