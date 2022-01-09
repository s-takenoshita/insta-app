class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_one_attached :avatar

  def has_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def follow!(user)
    # user_id = get_user_id(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow!(user)
    # user_id = get_user_id(user)
    relation = following_relationships.find_by!(following_id: user.id)
    relation.destroy!
  end

  def avatar_image
    if self.avatar&.attached?
      self.avatar
    else
      'default-avatar.png'
    end
  end
end
