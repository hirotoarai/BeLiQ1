class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable#, :validatable

  validates :name, uniqueness: true,length: { maximum: 20, minimum: 2 }
  validates :introduction, length: { maximum: 50 }
  validates :encrypted_password,    length: { minimum: 8 }
end
