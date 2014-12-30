require "rails_helper"

feature "user registers", %{
  As a visitor
  I want to register
  So that I can create an account
} do

  # Acceptance Criteria:
  # I must specify a unique username, unique email address,
  #   valid password, and password confirmation
  # If I don"t specify the required information,
  #   I am presented with an error message
  # I may specify my first name and last initial.
  # Last initial must be 1 one letter

  scenario "provide valid registration information" do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in "First name", with: user.first_name
    fill_in "Last initial", with: user.last_initial
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario "provide invalid registration information" do
    visit new_user_registration_path

    fill_in "Last initial", with: "HHH"

    click_button "Sign up"
    expect(page).to have_content("Username can't be blank")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Last initial is too long
                                 (maximum is 1 character)")
  end

  scenario "username already taken" do
    existing_user = FactoryGirl.create(:user)

    visit new_user_registration_path

    fill_in "First name", with: existing_user.first_name
    fill_in "Last initial", with: existing_user.last_initial
    fill_in "Username", with: existing_user.username
    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password
    click_button "Sign up"

    expect(page).to have_content("Username has already been taken")
  end

  scenario "user enters non letter for last initial" do
    user = FactoryGirl.build(:user)

    visit new_user_registration_path

    fill_in "First name", with: user.first_name
    fill_in "Last initial", with: "1"
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password

    click_button "Sign up"

    expect(page).to have_content("Last initial only allows letters")
  end
end
