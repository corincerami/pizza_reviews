require "rails_helper"

# As a User
# I want to view a list of all the pizzerias
# So I can see which ones have the best reviews

# Acceptance Criteria
# - [ ] I can see all pizzerias in one place
# - [ ] I can view a pizzeria's name, location, and recent reviews
# - [ ] Each review will be represented by a thumbnail and rating

feature "User views all pizzerias" do
  it "lists all pizzerias on one page" do
    pizzerias = FactoryGirl.create_list(:pizzeria, 2)
    pizzerias.each do |pizzeria|
      FactoryGirl.create_list(:review, 3, pizzeria: pizzeria)
    end

    visit pizzerias_path

    pizzerias.each do |pizzeria|
      expect(page).to have_content(pizzeria.name)
      pizzeria.reviews.each do |review|
        expect(page).to have_content review.title.first(20)
      end
      expect(pizzeria.reviews.last.title.first(20)).to appear_before(pizzeria.reviews.first.title.first(20))
    end
  end
end
