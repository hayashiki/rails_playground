FactoryBot.define do
  factory :user_social_profile do
    user
    name { user.name }
    email { user.email }
    uid "116975849408474758405"
  end
end
