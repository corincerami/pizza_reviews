require "rails_helper"

feature "post a comment", %{
  As a user
  I want to comment on reviews
  So I can share my opinion about the review

  Acceptance Criteria
  * Comments must have a title and a body
  * I am shown a confirmation message when my comment has posted successfully
  * I am shown errors when I try to post without all required information
  * My comment should appear on the review page
  } do

    let(:user) { FactoryGirl.create(:user) }
    let(:pizzeria) { FactoryGirl.create(:pizzeria)}
    let(:review) { FactoryGirl.create(:review, pizzeria: pizzeria) }

    scenario "user posts a comment with valid attributes" do
      visit review_path(review)
      # sign_in user
      save_and_open_page


      fill_in "Title", with: review.title
      fill_in "Comment", with: review.body
      click_button "Submit Comment"

      expect(page).to have_content "Comment has been posted sucessfully"
    end
  end
