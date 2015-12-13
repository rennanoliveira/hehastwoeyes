FactoryGirl.define do
  factory :user, aliases: [:manager] do
    sequence(:username) { |n| "chucknorris#{n}" }
  end

end
