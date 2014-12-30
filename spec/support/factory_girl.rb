require "factory_girl"

FactoryGirl.define do
  factory :user do
    first_name "Kerron"
    last_initial "H"
    username "kerronh"
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

end
