require "rails_helper"

feature "User creates a review" do
  it "fills out a form with valid information" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    pizzeria = FactoryGirl.create(:pizzeria)

    visit pizzeria_path(pizzeria)
    click_on "Create Review"

    fill_in "Title", with: "Pepperoni"
    fill_in "Body", with: "text text"
    select 5, from: "Rating"
    click_on "Create Review"

    expect(page).to have_content "Pepperoni"
    expect(page).to have_content "text text"
    expect(page).to have_content "5 stars"
  end

  it "submits a blank form" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    pizzeria = FactoryGirl.create(:pizzeria)

    visit pizzeria_path(pizzeria)
    click_on "Create Review"
    click_on "Create Review"
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Rating can't be blank"
  end

  it "attempts to create a review without signing in" do
    pizzeria = FactoryGirl.create(:pizzeria)

    visit pizzeria_path(pizzeria)
    click_on "Create Review"

    expect(page).to have_content "You need to sign in or sign up"
  end
end
