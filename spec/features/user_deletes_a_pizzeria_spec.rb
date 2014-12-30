require 'rails_helper'

# User story
# As a user,
# I want to delete pizzerias,
# So I can remove pizzerias that are no longer in business

# Acceptance Criteria
# - I can delete a pizzeria so it no longer appears on the index

feature 'User deletes a pizzeria' do
  it 'deletes a pizzeria' do
    pizzeria = FactoryGirl.create(:pizzeria)
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit pizzeria_path(pizzeria)

    click_on "Delete Pizzeria"

    expect(page).not_to have_content pizzeria.name
  end
end
