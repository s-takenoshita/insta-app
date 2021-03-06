class Post < ApplicationRecord

  validates :content, presence: true, length: { minimum: 4 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  has_many_attached :images
  
end
