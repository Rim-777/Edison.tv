FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    first_name 'SomeUserFirstName'
    last_name 'SomeUserLastName'
    password '12345678'
  end

end
