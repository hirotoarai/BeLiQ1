class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates_uniqueness_of :post_id, ccope: :user_id
end
