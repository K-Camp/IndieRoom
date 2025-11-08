class Game < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :genre
  has_one_attached :game_image
end
