class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :game

  validates :score,      presence: true
  validates :post_title, presence: true
  validates :content,    presence: true
end
