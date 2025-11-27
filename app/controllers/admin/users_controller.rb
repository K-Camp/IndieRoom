class Admin::UsersController < ApplicationController
  # 管理者ログインチェック
  before_action :authenticate_admin_user!
  before_action :set_user_id, only: [:show, :edit, :update, :destroy, :status]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザ情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザを削除しました。"
  end

  def status
    if @user.update(user_status_params)
      redirect_to admin_user_path(@user), notice: "ユーザの状態を更新しました"
    else
      redirect_to admin_user_path(@user), alert: "更新に失敗しました"
    end
  end

  private

  def set_user_id
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end

  # ステータス変更用のストロングパラメータ
  def user_status_params
    params.require(:user).permit(:is_active)
  end
end
