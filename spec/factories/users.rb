FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "chuck_norris-#{n}@example.com" }
    sequence(:username) { |n| "chucknorris#{n}" }
    password '12345678' # safe enough for chuck. Who would hack him?
  end

end
