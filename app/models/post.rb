class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :game

  validates :score,      presence: true
  validates :post_title, presence: true
  validates :content,    presence: true

  # 公開状態のものだけを表示できるように
  scope :public_posts, -> { where(is_public: true) }

  # Ransack で検索可能なカラムの許可リスト
  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "user_id",
      "game_id",
      "score",
      "post_title",
      "content",
      "created_at",
      "updated_at"
    ]
  end
end
