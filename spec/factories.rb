# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  factory :user, :class => User do |factory|
    factory.name                  "John Doe"
    factory.email                 "john@example.com"
    factory.password              "HelloWorld"
    factory.password_confirmation "HelloWorld"
  end
end