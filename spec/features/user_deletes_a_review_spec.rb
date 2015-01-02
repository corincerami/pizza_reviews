require "rails_helper"

# As a user
# I want to delete my review
# So it is no longer on the site

# Acceptance Criteria

# - My review should no longer appear on the site
# - I may only delete reviews I have posted
# - All comments are deleted when the review is deleted

feature "User deletes a review" do
  it "deletes a review the user posted" do
    review = FactoryGirl.create(:review)
    user = review.user

    sign_in(user)

    visit review_path(review)

    click_on "Delete Review"

    expect(page).to have_content "Review deleted"
    expect(page).not_to have_content review.title
  end
end
