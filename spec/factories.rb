FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :pizzeria do
    sequence(:name) { |n| "#{n} Regina Pizzeria" }
    sequence(:street) { |n| "#{n} Thacher St" }
    city 'Boston'
    state 'MA'
    zip_code '02113'
  end

  factory :review do
    sequence(:title) { |n| "#{n} This is my pizza slice" }
    sequence(:body) { |n| "#{n} Literally stumbled upon this place. I had been hearing 
      recommendations about Regina for months, and the one time I get lost in Boston 
      dumps me right on their doorstep. You can't ignore fate, even when it's 
      only 5pm!" }
    rating 4
    after(:build) do |review|
      review.pizzeria = FactoryGirl.create(:pizzeria)
      review.user = FactoryGirl.create(:user)
    end  
  end
end
