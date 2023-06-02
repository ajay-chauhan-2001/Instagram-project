class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts
         has_many :likes
         has_many :liked_posts, through: :likes, source: :post
          # has_many :followed_relationships, foreign_key: :follower_id, class_name: 'Follow'
          # has_many :followed_users, through: :followed_relationships, source: :followed
          # has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Follow'
          # has_many :followers, through: :follower_relationships, source: :follower
        
          def likes?(post)
            likes.exists?(post: post)
          end
end
