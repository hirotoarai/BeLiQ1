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

  # ユーザー情報編集のバリデーション
  # 名前は２文字以上、２０字以内
  validates :name, uniqueness: true, length: { maximum: 20, minimum: 2 }
  # 自己紹介文は、５０字以内
  validates :introduction, length: { maximum: 50 }
  # パスワードは、８文字以内
  validates :encrypted_password,    length: { minimum: 8 }

  def following?(other_user)
    self.followings.include?(other_user)
  end

  # フォローするユーザーが自分自身かどうか
  def follow(other_user)
    self.following_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end
end
