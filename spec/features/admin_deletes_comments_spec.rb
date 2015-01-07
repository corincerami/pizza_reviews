require "rails_helper"

feature "admin can delete comments", %{
  As a admin
  I want to delete comments
  So that I can keep content updated

  Acceptance Criteria
  * Admin must be able to delete comments from admin panel
  } do

  scenario "admin can delete comments" do
    comments = FactoryGirl.create_list(:comment, 10)

    admin = FactoryGirl.create(:user, admin: true)

    sign_in(admin)

    visit admin_comments_path

    first(".comment").click_link("Delete comment")

    expect(page).to have_content "Comment Deleted"
    expect(comments.count).to eq 10
  end

  scenario "unauthorized users are redirected" do
    user = FactoryGirl.create(:user)

    sign_in(user)

    visit admin_comments_path

    expect(page).to have_content "not authorized"
    expect(current_path).to eq(root_path)
  end
end
