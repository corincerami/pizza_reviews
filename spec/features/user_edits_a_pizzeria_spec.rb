require 'rails_helper'

# As a User
# I want to edit a pizzeria
# So I can fix outdated information

# Acceptance Criteria
# - I can supply a new name, address, website, or photo
# - The new information will appear on the page
# - I will see a confirmation message that my pizzeria was edited
# - I will see an error message if I fill out the form incorrectly

feature 'User edits a pizzeria' do
  it 'fills out new valid information' do
    user = FactoryGirl.create(:user)
    pizzeria = FactoryGirl.create(:pizzeria)
    sign_in(user)
    visit pizzeria_path(pizzeria)

    click_on "Edit Pizzeria"

    fill_in "Name", with: "New pizzeria"
    fill_in "Street", with: "New street"
    fill_in "City", with: "New city"
    fill_in "State", with: "New state"
    fill_in "Zip code", with: "New zip"
    click_on "Update Pizzeria"

    expect(page).to have_content "Pizzeria updated"
    expect(page).to have_content "New pizzeria"
    expect(page).to have_content "New street"
    expect(page).to have_content "New city"
    expect(page).to have_content "New state"
    expect(page).to have_content "New zip"
  end

  it 'fills out the form incorrectly' do
    user = FactoryGirl.create(:user)
    pizzeria = FactoryGirl.create(:pizzeria)
    sign_in(user)
    visit pizzeria_path(pizzeria)

    click_on "Edit Pizzeria"

    fill_in "Name", with: ""
    fill_in "Street", with: ""
    fill_in "City", with: ""
    fill_in "State", with: ""
    fill_in "Zip code", with: ""
    click_on "Update Pizzeria"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Street can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip code can't be blank"
  end
end
