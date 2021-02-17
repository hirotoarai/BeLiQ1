class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  # ユーザーネームは２文字以上、２０字以内
  validates :name, uniqueness: true,length: { maximum: 20, minimum: 2 }
  # パスワードは８文字以上
  validates :encrypted_password,    length: { minimum: 8 }
end
