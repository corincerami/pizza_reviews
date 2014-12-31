require "rails_helper"

# As a user,
# I would like to see all the pizza slice reviews at a certain pizzeria
# so I can read up on different slice options.

# Acceptence Criteria
# - User sees the name of the pizzeria and address
# - User can click on a pizzeria review on the pizzeria show page and see pizza slice reviews at that pizzeria.
# - User can see all slice ratings from this view


feature "User views all pizza slice reviews of a certain pizzeria" do
	it "shows all pizza slice reviews with rating" do
		review = FactoryGirl.create(:review)
		pizzeria = review.pizzeria
		visit pizzerias_path
		click_on pizzeria.name
	
		click_on review.title

		expect(page).to have_content review.body

	end
end

