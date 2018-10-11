class CreateUserSocialProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_social_profiles do |t|
      t.references :user, foreign_key: true
      t.string :provier
      t.string :uuid
      t.string :name
      t.string :image_url

      t.timestamps
    end
  end
end
