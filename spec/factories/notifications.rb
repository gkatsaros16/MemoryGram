FactoryGirl.define do
  factory :notification do
    user nil
    post_owner nil
    post nil
    identifier 1
    type ""
    read false
  end
end
