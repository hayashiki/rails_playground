# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  image_url  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :user_social_profiles

  def self.find_or_create_from_omniauth(omniauth)
    profile = UserSocialProfile.find_or_initialize_from_omniauth(omniauth: omniauth)

    find_or_create_from_social_profile(social_profile: profile)
  end

  private

  def self.find_or_create_from_social_profile(social_profile:)
    return social_profile.user if social_profile.user
    social_profile.user = create! do |user|
      user.name = social_profile.name
    end
    social_profile.save!
    social_profile.user
  end
end
