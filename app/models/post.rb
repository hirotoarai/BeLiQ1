class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  attachment :post_image

  def self.search(search, type)
    if search
      Post.where('title LIKE ?', "%#{search}%")
    else
      Post.all
    end
  end
end
