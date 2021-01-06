class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content,    length: { in: 1..300 }
end
