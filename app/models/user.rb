class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image, destroy: false

  # def already_favorited?(post)
  #   self.favorites.exists?(post_id: post.id)
  # end

  # def active_for_authentication?
  #   super && (self.is_deleted == false)
  # end

  #scope :only_active, -> { where(is_active: true) }
end
