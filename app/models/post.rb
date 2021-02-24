class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  # プレビュー機能の画像アップ用のメソッド
  attachment :post_image
  # 投稿タイトルは２文字以上、４０文字以内とする
  validates :title, presence: true, length: { maximum: 40, minimum: 2 }
  # 投稿内容は、１０００文字以内とする
  validates :body, presence: true, length: { maximum: 1000 }
  # 投稿カテゴリー は必須事項
  validates :category, presence: true

  # いいねしているかどうかを確かめるメソッド
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # posts createのsave_tagを定義
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

  # searchメソッドを定義
  def self.search(search, type)
    if search
      # 投稿のタイトルと本文で検索
      Post.where('title LIKE ?', "%#{search}%")
      Post.where('body LIKE ?', "%#{search}%")
    else
      Post.all
    end
  end
end