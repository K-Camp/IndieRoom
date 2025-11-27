class Admin::HomesController < ApplicationController
  # 管理者ログインチェック
  before_action :authenticate_admin_user!

  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).page(params[:page]).order("created_at desc")
  end
end
