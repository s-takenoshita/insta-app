class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

  def has_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def avatar_image
    if self.avatar&.attached?
      self.avatar
    else
      'default-avatar.png'
    end
  end
end
