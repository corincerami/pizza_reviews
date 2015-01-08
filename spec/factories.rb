FactoryGirl.define do

  factory :user do
    first_name "Kerron"
    last_initial "H"
    sequence(:username) {|n| "#{n}kerronh"}
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
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
    sequence(:body) do |n|
      "#{n} Literally stumbled upon this place. I had been
      hearing recommendations about Regina for months, and the one time I get
      lost in Boston dumps me right on their doorstep. You can't ignore fate,
      even when it's only 5pm!"
    end
    rating 4
    user
    pizzeria
  end

  factory :comment do
    sequence(:title) { |n| "#{n} This review is awesome" }
    sequence(:body) do |n|
      "#{n} Literally stumbled upon this place. I had been
      hearing recommendations about Regina for months, and the one time I get
      lost in Boston dumps me right on their doorstep. You can't ignore fate,
      even when it's only 5pm!"
    end
    user
    review
  end
end
