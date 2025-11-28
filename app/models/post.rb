class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :game

  validates :score,      presence: true
  validates :post_title, presence: true
  validates :content,    presence: true

  # 公開状態のものだけを表示できるように
  scope :public_posts, -> { where(is_public: true) }
  
  # Ransack が検索していい関連をここに記述
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  # Ransack 検索許可カラムリスト
  def self.ransackable_attributes(auth_object = nil)
    ["post_title", "content", "created_at", "updated_at", "score", "is_public"]
  end
end
