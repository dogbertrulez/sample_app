# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  factory :valid_user, :class => User do |a_user|
    a_user.name                  "John Doe"
    a_user.email                 "example@railstutorial.org"
    a_user.password              "HelloWorld"
    a_user.password_confirmation "HelloWorld"
  end
end