require "rails_helper"

feature "user edits comment", %{
  As a user
  I want to edit my comment
  So that I can correct or update my comment
  Acceptance Criteria
  * I may only edit a comment I posted
  * I must provide valid information
  * I am shown a confirmation message if my comment updates successfully
  * I am shown errors if my information is invalid
  * My updated comment displays on the review details page
  } do

  let(:comment) { FactoryGirl.create(:comment) }
  scenario "user can edit a comment" do
    sign_in(comment.user)

    visit review_path(comment.review)

    click_on "Edit comment"

    fill_in "Title", with: "New Title"
    fill_in "Comment", with: "New Body"

    click_button "Update Comment"

    expect(page).to have_content "Comment has been updated"
    expect(page).to have_content "New Title"
    expect(page).to have_content "New Body"
  end

  scenario "user doesn't provide valid information" do
    sign_in(comment.user)

    visit review_path(comment.review)

    click_on "Edit comment"

    fill_in "Title", with: ""
    fill_in "Comment", with: ""

    click_button "Update Comment"

    expect(page).to have_content "can't be blank"
  end

  scenario "invalid user can't edit comment" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit review_path(comment.review)

    expect(page).not_to have_content "Edit comment"
  end
end
