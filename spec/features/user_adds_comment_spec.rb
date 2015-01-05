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

    let(:comment) { FactoryGirl.create(:comment) }

    scenario "user posts a comment with valid attributes" do
      sign_in(comment.user)
      visit review_path(comment.review)

      fill_in "Title", with: comment.title
      fill_in "Comment", with: comment.body
      click_button "Submit Comment"

      expect(page).to have_content "Comment has been posted sucessfully"
    end

    scenario "user receives error messages for invalid input" do
      sign_in(comment.user)

      visit review_path(comment.review)

      click_button "Submit Comment"

      expect(page).to have_content "can't be blank"
    end
  end
