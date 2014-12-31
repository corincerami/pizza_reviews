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

	it "fills out invalid information" do
		review = FactoryGirl.create(:review)
		pizzeria = review.pizzeria
		user = review.user
		sign_in(user)
		visit pizzeria_review_path(pizzeria, review)

		click_on "Edit Review"

		fill_in "Title", with: ""
		fill_in "Body", with: ""
		select "", from: "Rating"
		click_on "Update Review"

		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Body can't be blank"
		expect(page).to have_content "Rating can't be blank"
	end

	it "tries to edit a review that was not created by user" do
		review = FactoryGirl.create(:review)
		pizzeria = review.pizzeria
		user = review.user
		user1 = FactoryGirl.create(:user)
		sign_in(user1)
		visit pizzeria_review_path(pizzeria, review)

		click_on "Edit Review"

		expect(page).to have_content "You do not have permission to edit this review"
	end

	

	
end
