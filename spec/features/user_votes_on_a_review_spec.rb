require "rails_helper"

feature "User votes on a review", %{
  As a user
  I want to upvote or downvote a review
  So that I can express if I liked the review or not

  * My vote should add to the total vote count for a review
  * My vote should increase/decrease the score of the review
  * If I vote differently, my original vote is overwritten
  * If I vote the same way again, my vote is cancelled out
  } do

  let(:user) { FactoryGirl.create(:user) }
  let(:pizzeria) { FactoryGirl.create(:pizzeria) }
  let(:review) { FactoryGirl.create(:review, pizzeria: pizzeria) }

  scenario "user upvotes a review" do
    sign_in(user)

    visit review_path(review)

    first(".upvote").click

    expect(page).to have_content "Vote recorded"
  end

  scenario "user downvotes a review" do
    sign_in(user)

    visit review_path(review)

    first(".downvote").click

    expect(page).to have_content "Vote recorded"
  end

  scenario "upvote button doesn't appear if user has upvoted" do
    sign_in(user)

    visit review_path(review)

    first(".upvote").click

    expect(page).not_to have_button "Upvote Review"
  end

  scenario "downvote button doesn't appear if user has downvoted" do
    sign_in(user)

    visit review_path(review)

    first(".downvote").click

    expect(page).not_to have_button "Downvote Review"
  end
end
