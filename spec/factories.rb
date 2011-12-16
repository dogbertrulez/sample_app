# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  factory :user do
    ￼name                  "John Doe"
    email                 "john@doe.com"
    password              "HelloWorld"
    password_confirmation "HelloWorld"
  end
end