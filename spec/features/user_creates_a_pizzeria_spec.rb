require "rails_helper"

# As a user
# I want to add a pizzeria
# So that I can share a pizzeria's information

# Acceptance Criteria
# - Pizzerias must have a name, street, city, state, zip code.
# - Pizzerias may optionally a phone number, description, website.
# - Pizzerias' addresses must be unique
# - Users must be signed in to create a pizzeria

feature "User creates a pizzeria" do
  it "fills out the form with valid information" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit new_pizzeria_path

    fill_in "Name",         with: "Regina Pizzeria"
    fill_in "Street",       with: "33 Harisson Ave"
    fill_in "City",         with: "Boston"
    fill_in "State",        with: "MA"
    fill_in "Zip code",     with: "07110"
    fill_in "Phone number", with: "973-667-7296"
    fill_in "Website",      with: "www.google.com"
    click_on "Create Pizzeria"

    expect(page).to have_content "Pizzeria created"
    expect(page).to have_content "Regina Pizzeria"
    expect(page).to have_content "33 Harisson Ave"
    expect(page).to have_content "Boston"
    expect(page).to have_content "MA"
    expect(page).to have_content "07110"
  end

  it "enters invalid information" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit new_pizzeria_path

    click_on "Create Pizzeria"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Street can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip code can't be blank"
  end

  it "enters a duplicate address" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    pizzeria = FactoryGirl.create(:pizzeria)

    visit new_pizzeria_path

    fill_in "Name",         with: pizzeria.name
    fill_in "Street",       with: pizzeria.street
    fill_in "City",         with: "Boston"
    fill_in "State",        with: "MA"
    fill_in "Zip code",     with: "07110"
    fill_in "Phone number", with: "973-667-7296"
    fill_in "Website",      with: "www.google.com"
    click_on "Create Pizzeria"

    expect(page).to have_content "Street has already been taken"
  end

  it "tries to create a pizzeria without signing in" do
    visit new_pizzeria_path

    expect(page).to have_content "You need to sign in or sign up before continuing"
  end
end
