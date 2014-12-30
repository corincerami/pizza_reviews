require 'rails_helper'

# As a User
# I want to view a list of all the pizzerias
# So I can see which ones have the best reviews

# Acceptance Criteria
# - [ ] I can see all pizzerias in one place
# - [ ] I can view a pizzeria's name, location, and recent reviews
# - [ ] Each review will be represented by a thumbnail and rating

feature 'User views all pizzerias' do
	it 'lists all pizzerias on one page' do
		pizzeria_1 = FactoryGirl.create(:pizzeria)
		pizzeria_2 = FactoryGirl.create(:pizzeria)

		visit pizzerias_path

		expect(page).to have_content pizzeria_1.name
		expect(page).to have_content pizzeria_2.name
	end
end
