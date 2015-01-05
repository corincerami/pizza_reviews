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

      click_on "Upvote Review"

      expect(page).to have_content "Vote recorded"
      expect(page).to have_content "1 vote(s) on this review"
      expect(page).to have_content "Review's score: 1"
    end

    scenario "user downvotes a review" do
      sign_in(user)

      visit review_path(review)

      click_on "Downvote Review"

      expect(page).to have_content "Vote recorded"
      expect(page).to have_content "1 vote(s) on this review"
      expect(page).to have_content "Review's score: -1"
    end

    scenario "upvote button doesn't appear if user has upvoted" do
      sign_in(user)

      visit review_path(review)

      click_on "Upvote Review"

      expect(page).not_to have_content "Upvote Review"
    end

    scenario "downvote button doesn't appear if user has downvoted" do
      sign_in(user)

      visit review_path(review)

      click_on "Downvote Review"
      
      expect(page).not_to have_content "Downvote Review"
    end

    scenario "switching votes removes the old vote and updates score" do
      sign_in(user)

      visit review_path(review)

      click_on "Upvote Review"
      click_on "Downvote Review"

      expect(page).to have_content "1 vote(s) on this review"
      expect(page).to have_content "Review's score: -1"
    end
end
