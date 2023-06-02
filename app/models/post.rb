class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user

    has_many :likes
    has_many :liking_users, through: :likes, source: :user
    has_many :comments

    def posted_minutes_ago
        ((Time.zone.now - created_at) / 60).to_i
      end
end
