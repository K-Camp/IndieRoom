class Public::HomesController < ApplicationController
  def top
    @latest_games = Post.public_posts.order(created_at: :desc).limit(3)
  end

  def about
  end
  
end
