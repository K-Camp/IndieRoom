class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :withdraw]

  def show
    @user = current_user
    # 自分の投稿したレビューを取得
    @posts = @user.posts.includes(:game).order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def withdraw
    current_user.update(is_active: false)
    sign_out current_user
    redirect_to root_path
  end

  private

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:user_name, :introduction, :email,  :role, :is_active, :profile_image)
  end
end
