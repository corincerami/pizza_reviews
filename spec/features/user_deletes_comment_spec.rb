require "rails_helper"

feature "delete a comment", %{
  As a User
  I want to delete a comment
  So that it no longer appears on the review
  Acceptance Criteria
  * I may only delete a comment I have posted
  * I am shown a confirmation message when my comment is deleted
  * My comment no longer appears on the review page
  } do

  let(:comment) { FactoryGirl.create(:comment) }
  scenario "user can delete a comment" do
    sign_in(comment.user)

    visit review_path(comment.review)

    click_on "Delete comment"

    expect(page).to have_content "Comment has been deleted"
  end
end
