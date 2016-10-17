FactoryGirl.define do
  factory :user do
    sequence(:user_name) { |n| "user_name#{n + 1}" }
    sequence(:email)      { |n| "email#{n + 1}@example.com" }
    password 'cggandantieku'
    password_confirmation 'cggandantieku'
  end
end
