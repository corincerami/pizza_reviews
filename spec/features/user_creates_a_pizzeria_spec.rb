require 'rails_helper'

# As a user
# I want to add a pizzeria
# So that I can share a pizzeria's information

# Acceptance Criteria
# - Pizzerias must have a name, city.
# - Pizzerias may optionally a phone number, description, website, photo
# - Pizzerias' addresses must be unique

feature 'User created a pizzeria' do
  it 'fills out the form with valid information' do
    user = FactoryGirl.create(:user)

    visit new_pizzeria_path

    fill_in "Name",         with: "Regina Pizzeria"
    fill_in "Street",       with: "33 Harisson Ave"
    fill_in "City",         with: "Boston"
    fill_in "State",        with: "MA"
    fill_in "Zip code",     with: "07110"
    fill_in "Phone number", with: "973-667-7296"
    fill_in "Website",      with: "www.google.com"
    click_on "Create pizzeria"

    expect(page).to have_content "Pizzeria created"
    expect(page).to have_content "Regina Pizzeria"
    expect(page).to have_content "33 Harisson Ave"
    expect(page).to have_content "Boston"
    expect(page).to have_content "MA"
    expect(page).to have_content "07110"
  end
end
