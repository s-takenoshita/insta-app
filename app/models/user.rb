class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def avatar_image
    if self.avatar&.attached?
      self.avatar
    else
      'default-avatar.png'
    end
  end
end
