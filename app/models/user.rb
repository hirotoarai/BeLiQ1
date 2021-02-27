class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # アタッチメントメソッドを追加
  attachment :profile_image, destroy: false

  validates :name, uniqueness: true, length: { maximum: 20, minimum: 2 }
  validates :introduction, length: { maximum: 50 }
  validates :encrypted_password,    length: { minimum: 8 }

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    self.following_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end

  # def already_favorited?(post)
  #   self.favorites.exists?(post_id: post.id)
  # end

  # def active_for_authentication?
  #   super && (self.is_deleted == false)
  # end

  #scope :only_active, -> { where(is_active: true) }
end
