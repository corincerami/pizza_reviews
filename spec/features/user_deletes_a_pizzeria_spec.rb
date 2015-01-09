require "rails_helper"

# User story
# As a user,
# I want to delete pizzerias,
# So I can remove pizzerias that are no longer in business

# Acceptance Criteria
# - I can delete a pizzeria so it no longer appears on the index

feature "User not authorized to delete a pizzeria" do
  it "prevents non admin from deleting a pizzeria" do
    pizzeria = FactoryGirl.create(:pizzeria)
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit pizzeria_path(pizzeria)

    expect(page).to_not have_content "Delete Pizzeria"
  end
end
