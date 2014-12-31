require "rails_helper"

feature "User edits a review" do
	it "shows the new information on the page" do
		review = FactoryGirl.create(:review)
		pizzeria = review.pizzeria
		user = review.user
		sign_in(user)
		visit pizzeria_review_path(pizzeria, review)

		click_on "Edit Review"

		fill_in "Title", with: "Edited Title"
		fill_in "Body", with: "Edited Body"
		select 2, from: "Rating"
		click_on "Update Review"

		expect(page).to have_content "Edited Title"
		expect(page).to have_content "Edited Body"
		expect(page).to have_content "2 stars"
	end
end
