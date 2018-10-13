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

require 'rails_helper'

RSpec.describe UserSocialProfile, type: :model do
  it 'has a valid factory' do
    expect(create :user_social_profile).to be_valid
  end

  # TODO
  # describe '.validations' do
  # end

  describe '.associations' do
    it { is_expected.to belong_to :user }
  end
end
