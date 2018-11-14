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

require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(create :user).to be_valid
  end

  describe '.associations' do
    it { is_expected.to have_many :user_social_profiles }
  end

  describe '.find_or_create_from_omniauth' do

    let(:auth_hash) {
      OmniAuth::AuthHash.new(
        provider: "google_oauth2",
        uid: "123456789",
        info: {
          name: "hogehoge",
          email: Faker::Internet.email,
          image: Faker::Avatar.image
        },
        credentials: {
          token: 'token'
        }
      )
    }
    subject { User.find_or_create_from_omniauth(auth_hash) }
    it { is_expected.to be_a User }

    it 'Create User and SocialProfile record' do
      expect{subject}.to change(User, :count).by(1).and change(UserSocialProfile, :count).by(1)
    end

    context 'Exist SignUp User' do
      before { User.find_or_create_from_omniauth(auth_hash) }
      it { is_expected.to be_a User }
      it 'Find User and SocialProfile record' do
        expect{subject}.to change(User, :count).by(0).and \
                           change(UserSocialProfile, :count).by(0)
      end
    end
  end
end
