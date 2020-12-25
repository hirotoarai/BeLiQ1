class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :post_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search, type)
    if search
      Post.where('title LIKE ?', "%#{search}%")
    else
      Post.all
    end
  end
end
