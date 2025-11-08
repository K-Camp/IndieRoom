class Post < ApplicationRecord

  has_many :comments
  belongs_to :user
  belongs_to :game

  enum score: {
    one_star:    1,
    two_stars:   2,
    three_stars: 3,
    four_stars:  4,
    five_stars:  5
  }

end
