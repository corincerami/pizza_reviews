require "rails_helper"

feature "Search pizzerias" do
  scenario "fill in search form and view results" do
    regina = FactoryGirl.create(:pizzeria, name: "Pizzeria Regina")
    crazy_kitchen = FactoryGirl.create(:pizzeria, name: "Crazy Kitchen Pizza")
    crazy_dough = FactoryGirl.create(:pizzeria, name: "Crazy Dough")

    visit pizzerias_path
    fill_in "Search", with: "crazy"
    click_button "Search Pizzerias"

    expect(page).to have_link crazy_kitchen.name,
                              href: pizzeria_path(crazy_kitchen)
    expect(page).to have_link crazy_dough.name,
                              href: pizzeria_path(crazy_dough)
    expect(page).not_to have_content regina.name
  end
end
