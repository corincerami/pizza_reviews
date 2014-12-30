FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :pizzeria do
    sequence(:name) { |n| "#{n} Regina Pizzeria"}
    sequence(:street) { |n| "#{n} Thacher St" }
    city 'Boston'
    state 'MA'
    zip_code '02113'
  end
end
