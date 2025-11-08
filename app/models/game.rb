class Game < ApplicationRecord
  has_many :posts
  belongs_to :genre
  has_one_attached :game_image
end
