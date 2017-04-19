FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    sequence(:username) {|n| "jondoe#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
  end
end
