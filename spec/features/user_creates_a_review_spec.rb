require "rails_helper"
# As a user
# I want to edit my review
# So that I can correct or update my review

# Acceptance Criteria
# I may edit a review that I posted
# I must provide valid information
# I am presented with errors if my information is invalid

feature "User creates a review" do
	it "fills out a form with valid information" do
		user = FactoryGirl.create(:user)
		sign_in(user)
		pizzeria = FactoryGirl.create(:pizzeria)

		visit pizzeria_path(pizzeria)
		click_on "Create Review"

		fill_in "Title", with: "Pepperoni"
		fill_in "Body", with: "text text"
		select 5, from: "Rating"
		click_on "Create Review"
		expect(page).to have_content "Pepperoni"
    expect(page).to have_content "text text"
    expect(page).to have_content "5 stars"
	end

	it "submits a blank form" do
		user = FactoryGirl.create(:user)
		sign_in(user)
		pizzeria = FactoryGirl.create(:pizzeria)

		visit pizzeria_path(pizzeria)
		click_on "Create Review"
		click_on "Create Review"
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Rating can't be blank"
	end
end
