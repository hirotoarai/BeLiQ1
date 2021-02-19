class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # 同じ投稿に複数いいねを付けないようにする
  validates_uniqueness_of :post_id, scope: :user_id
end
