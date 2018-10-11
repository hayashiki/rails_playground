# == Schema Information
#
# Table name: user_social_profiles
#
#  id         :bigint(8)        not null, primary key
#  image_url  :string
#  name       :string
#  provier    :string
#  uuid       :string
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
end
