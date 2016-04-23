FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    first_name 'SomeUserFirstName'
    last_name 'SomeUserLastName'
    password '12345678'
    confirmed_at '2016-04-22 01:18:57.297631'
  end
  
end
