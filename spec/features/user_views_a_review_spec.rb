require "rails_helper"
include ApplicationHelper

# As a user,
# I would like to see all the pizza slice reviews at a certain pizzeria
# so I can read up on different slice options.

# Acceptence Criteria
# - User sees the name of the pizzeria and address
# - User can click on a pizzeria review on the pizzeria show page and see pizza
# 	slice reviews at that pizzeria.
# - User can see all slice ratings from this view
# - User can see who created the review

feature "User views a review" do
  it "sees the review data on a page" do
    review = FactoryGirl.create(:review)
    pizzeria = review.pizzeria
    visit pizzerias_path
    within(:css, "li.pizzeria-name") do
      click_on pizzeria.name
    end

    within(:css, "span.review-title") do
      click_on review.title
    end

    expect(page).to have_content review.body
    expect(page).to have_content pizzeria.name
    expect(page).to have_content pizzeria.street
    expect(page).to have_content review.rating
    expect(page).to have_content format_datetime(review.created_at)
    expect(page).to have_content format_datetime(review.updated_at)
    expect(page).to have_content review.user_full_name
  end
end
