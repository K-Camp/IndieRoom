class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  has_many :posts,    dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_name, presence:true

  # ログイン前にis_activeをチェック
  def active_for_authentication?
    super && is_active
  end

  # Ransack が検索していい関連をここに記述
  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end

  # Ransack 検索許可カラムリスト
  def self.ransackable_attributes(auth_object = nil)
    ["user_name"]
  end
end
