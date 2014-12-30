require 'rails_helper'

# As a User
# I want to view a pizzeria's details and reviews
# So I can see how good their pizza is

# Acceptance Criteria
# - I can see the pizzeria's name, address, and photo
# - I can all of the reviews for this pizzeria

feature "User views a pizzeria's details" do
  it 'sees the details on the page' do
    pizzeria = FactoryGirl.create(:pizzeria)

    visit pizzeria_path(pizzeria)

    expect(page).to have_content pizzeria.name
    expect(page).to have_content pizzeria.street
    expect(page).to have_content pizzeria.city
    expect(page).to have_content pizzeria.state
    expect(page).to have_content pizzeria.zip_code
  end
end
