class Game < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :genre
  has_one_attached :game_image

  validates :game_name,    presence: true
  validates :synopsis,     presence: true
  validates :release_date, presence: true
end
