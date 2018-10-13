# == Schema Information
#
# Table name: user_social_profiles
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  image_url  :string
#  name       :string
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_user_social_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class UserSocialProfile < ApplicationRecord
  belongs_to :user

  def self.find_or_initialize_from_omniauth(omniauth:)
    social_profile = find_or_initialize_by(
      provider: omniauth[:provider],
      uid: omniauth[:uid]
    )
    social_profile.assign_attributes(
      name: omniauth[:info][:name],
      email: omniauth[:info][:email],
      image_url: omniauth[:info][:image]
    )
    social_profile    
  end
end
