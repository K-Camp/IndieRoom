class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :withdraw]

  def show
    @user = User.find(params[:id])
    # 自分の投稿したレビューを取得
    @posts = @user.posts.includes(:game).order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "プロフィールの更新に失敗しました。入力内容を確認してください。"
      render :edit
    end
  end

  def withdraw
    if current_user.update(is_active: false)
      sign_out current_user
      flash[:notice] = "退会処理が完了しました。ありがとうございました。"
      redirect_to root_path
    else
      flash[:alert] = "退会処理に失敗しました。"
      redirect_to edit_user_path
    end
  end

  private

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:user_name, :introduction, :email, :role, :is_active, :profile_image)
  end
end
