require "rails_helper"

feature "admin can delete reviews", %{
  As a admin
  I want to delete reviews
  So that I can keep content updated

  Acceptance Criteria
  * Admin must be able to delete pizzerias from admin panel
  } do

  scenario "admin can delete a review" do
    reviews = FactoryGirl.create_list(:review, 10)

    admin = FactoryGirl.create(:user, admin: true)

    sign_in(admin)

    visit admin_reviews_path

    first(".review").click_link("Delete review")

    expect(page).to have_content "Review deleted"
    expect(Review.count).to eq 9
  end

  scenario "unauthorized users are redirected" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit admin_reviews_path

    expect(page).to have_content "not authorized"
    expect(current_path).to eq(root_path)
  end
end
