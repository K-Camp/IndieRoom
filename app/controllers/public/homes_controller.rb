class Public::HomesController < ApplicationController
  def top
    @latest_games = Post.order(created_at: :desc).limit(3)
  end

  def about
  end
  
end
