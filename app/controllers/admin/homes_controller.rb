class Admin::HomesController < ApplicationController
  # 管理者のみアクセス可
  before_action :authenticate_admin_user!

  def top
    @posts = Post.includes(:user).order(created_at: :desc)
  end
end
