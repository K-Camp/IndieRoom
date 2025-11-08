class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  has_many :posts,    dependent: :destroy
  has_many :comments, dependent: :destroy

  # ログイン前にis_activeをチェック
  def active_for_authentication?
    super && is_active
  end
end
