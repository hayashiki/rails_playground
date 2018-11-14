# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  image_url              :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

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
      user.email = social_profile.email
      user.password = Devise.friendly_token[0, 20]
    end
    social_profile.save!
    social_profile.user
  end
end
