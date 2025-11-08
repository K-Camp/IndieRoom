class UsersController < ApplicationController

  def show
    @user = current_user
    @posts = @user.posts.includes(:game).order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to my_page_path
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def withdraw
    current_user.update(is_active: false)
    sign_out current_user
    flash[:notice] = "退会が完了しました。ご利用ありがとうございました。"
    redirect_to root_path
  end

  private

  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:user_name, :introduction, :email,  :role, :is_active)
  end
end
