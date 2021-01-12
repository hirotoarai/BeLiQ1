class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  attachment :post_image

  validates :title, presence: true, length: { maximum: 40, minimum: 2 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :category, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  def self.search(search, type)
    if search
      Post.where('title LIKE ?', "%#{search}%")
    else
      Post.all
    end
  end
end