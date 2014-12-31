require "rails_helper"

feature "user profile", %{
  As a user
  I want to delete my account
  So that I am no longer a user

  Acceptance Criteria
  * I get a confirmation that my account has been deleted
  * All of my reviews and comments are deleted when I close my account
  } do

    let(:user) { FactoryGirl.create(:user) }

    scenario "user may delete their own account" do
      sign_in user

      visit edit_user_registration_path

      click_button "Cancel my account"
      
      expect(page).to have_content("Your account has been successfully
                                    cancelled")
    end
  end
